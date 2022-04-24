import { storage, Context } from "near-sdk-as"
import { Plant } from "./model"

// return the string 'hello world'
export function menu(): string {
  return Plant.menu();
}

// create Order As Farmer
export function createOrderAsFarmer(): string {
  return 'sended by farmer to store'
}

// create Order As Store
export function createOrderAsStore(): string {
  return 'sended by store to customer'
}

// get Plant Info
export function getPlantInfo(id: u32): Array<string> {
  return Plant.getPlantInfo(id);
}

// set Planting Time
export function setPlantingTime(id: u32, platingTime: string): string {
  return Plant.setPlantingTime(id, platingTime);
}

// set Fertilizer TYpe
export function setFertilizerType(id: u32, fertilizerType: string): string {
  return Plant.setFertilizerType(id, fertilizerType);
}

// set Planting Time
export function setHarvestTime(id: u32, harvestTime: string): string {
  return Plant.setHarvestTime(id, harvestTime);
}

// set Harvest Time
export function setLocation(id: u32, location: string): string {
  return Plant.setLocation(id, location);
}

// set string Of Arrival
export function setDateOfArrival(id: u32, dateOfArrival: string): string {
  return Plant.setDateOfArrival(id, dateOfArrival);
}

// set Remaining Life
export function setRemainingLife(id: u32, remainingLife: string): string {
  return Plant.setRemainingLife(id, remainingLife);
}

// set enter As  
export function enterAs(user: string): string {
  return Plant.enterAs(user);
}


// read the given key from account (contract) storage
export function read(key: string): string {
  if (storage.hasKey(key)) {
    return `✅ Key [ ${key} ] has value [ ${storage.getString(key)!} ]`
  } else {
    return `🚫 Key [ ${key} ] not found in storage. ( ${storageReport()} )`
  }
}

// write the given value at the given key to account (contract) storage
export function write(key: string, value: string): string {
  storage.set(key, value)
  return `✅ Data saved. ( ${storageReport()} )`
}

// private helper method used by read() and write() above
function storageReport(): string {
  return `storage [ ${Context.storageUsage} bytes ]`
}
