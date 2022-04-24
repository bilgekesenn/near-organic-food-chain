// assembly/model.ts
import {
    PersistentUnorderedMap, math,
    Context,
    PersistentVector,
} from "near-sdk-as";

import { AccountId, Money, Timestamp } from "./utils";

//create plants on blockchain
export const plants = new PersistentUnorderedMap<u32, Plant>("plant");
export const plantOwner = new PersistentUnorderedMap<u32, Array<AccountId>>("access");


@nearBindgen
export class Plant {
    id: u32
    user: string
    owner: AccountId = Context.sender
    ownerType: string
    type: PersistentVector<Type> = new PersistentVector<Type>("type")
    info: PersistentVector<Info> = new PersistentVector<Info>("info")
    desc: string
    plantingTime: string
    fertilizerType: string
    harvestTime: string
    location: string
    departureTime: string
    dateOfArrival: string
    remainingLife: string
    price: Money

    constructor(desc: string, price: Money) {
        this.desc = desc;
        this.price = price
    }

    static menu(): string {
        return "createOrderAsFarmer\ncreateOrderAsStore\nsetPlantingTime\nsetFertilizerType\nsetHarvestTime\nsetLocation\nsetDateOfArrival\nsetRemainingLife\nenterAs"
    }

    static createPlant(desc: string, price: Money): Plant {
        const plant = new Plant(desc, price);
        plants.set(plant.id, plant);
        return plant;
    }

    static setPlantingTime(id: u32, plantingTime: string): string {
        let plant = this.findPlantById(id);
        this.assert_owner(plant, Context.sender);
        plant.plantingTime = plantingTime;
        plants.set(plant.id, plant);
        return plant.plantingTime
    }

    static getPlantInfo(id: u32): Array<string> {
        let plant = this.findPlantById(id);
        let list = new Array<string>();
        list.push(plant.plantingTime);
        list.push(plant.fertilizerType);
        list.push(plant.harvestTime);
        list.push(plant.location);
        list.push(plant.dateOfArrival);
        list.push(plant.remainingLife);
        return list;
    }

    static setFertilizerType(id: u32, fertilizerType: string): string {
        let plant = this.findPlantById(id);
        this.assert_owner(plant, Context.sender);
        plant.fertilizerType = fertilizerType;
        plants.set(plant.id, plant);
        return plant.fertilizerType
    }

    static setHarvestTime(id: u32, harvestTime: string): string {
        let plant = this.findPlantById(id);
        this.assert_owner(plant, Context.sender);
        plant.harvestTime = harvestTime;
        plants.set(plant.id, plant);
        return plant.harvestTime
    }

    static setLocation(id: u32, location: string): string {
        let plant = this.findPlantById(id);
        this.assert_owner(plant, Context.sender);
        plant.location = location;
        plants.set(plant.id, plant);
        return plant.location
    }

    static setDateOfArrival(id: u32, dateOfArrival: string): string {
        let plant = this.findPlantById(id);
        this.assert_owner(plant, Context.sender);
        plant.dateOfArrival = dateOfArrival;
        plants.set(plant.id, plant);
        return plant.dateOfArrival
    }

    static setRemainingLife(id: u32, remainingLife: string): string {
        let plant = this.findPlantById(id);
        this.assert_owner(plant, Context.sender);
        plant.remainingLife = remainingLife;
        plants.set(plant.id, plant);
        return plant.remainingLife
    }

    static enterAs(user: string): string {
        if (user == "farmer" || user == "Farmer") {
            return "entered as farmer"
        }
        else if (user == "store" || user == "Store") {
            return "entered as store"
        }
        else if (user == "customer" || user == "Customer") {
            return "entered as customer"
        }
        else {
            return "wrong user type"
        }
    }


    static buyPlant(id: u32): void {
        let user = Plant.enterAs
        this.assert_amount(id)
        let list: Array<AccountId>
        if (plantOwner.contains(id)) {
            list = plantOwner.getSome(id);
            list.push(Context.sender);
            plantOwner.set(id, list);
        }
        else {
            let list = new Array<AccountId>();
            list.push(Context.sender);
            plantOwner.set(id, list);
        }
    }

    static findPlantById(id: u32): Plant {
        return plants.getSome(id);
    }

    static assert_owner(plant: Plant, caller: AccountId): void {
        assert(plant.owner == caller, 'Only owner can call this function!');
    }

    static assert_access(id: u32, caller: AccountId): void {
        let list = plantOwner.getSome(id);
        assert(list.indexOf(caller) != -1, "Only plant owner can call this function!");
    }
    // Book price must be lower or equal than deposited money
    static assert_amount(id: u32): void {
        let plant = this.findPlantById(id);
        assert(plant.price <= Context.attachedDeposit, "Not enough money attached!")
    }
}

@nearBindgen
export class Type {
    created_at: Timestamp = Context.blockTimestamp;
    type: string
    constructor(text: string) {
        this.type = text
    }
}

@nearBindgen
export class Info {
    created_at: Timestamp = Context.blockTimestamp;
    owner: AccountId = Context.predecessor;
    info: string
    constructor(text: string) {
        this.info = text
    }
}