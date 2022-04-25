# near-organic-food-chain

This project is a simple organic food chain program on the Near blockchain. Farmers can create a plant function and add info about them. Store can buy from farmers and update info like remaining life time. After that, customer can observe plants' info and buy them. With the help of this project, you can be sure about the freshness of your products and learn about their journey all the way to your kitchen. 

## Installation

git clone https://github.com/bilgekesenn/near-organic-food-chain

## Steps

* To Login
```
near login
```

* Export the development account to the $CONTRACT
```
export CONTRACT=YOUR_DEV_ACCOUNT_HERE
```

* To Build
```
yarn build:release
```

* To Deploy
```
near dev-deploy ./build/release/simple.wasm
```

* To See Menu
```
near call $CONTRACT menu --accountId <YOUR_TESTNET_ACCOUNT>.testnet
```

* Enter As (farmer,store,customer)
```
near call $CONTRACT enterAs '{"user": "user_name"}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet
```

* createPlant (as a farmer you can create plant)
```
near call $CONTRACT createPlant '{"desc": "description", "price": price}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet
```

* setPlantingTime
```
near call $CONTRACT setPlantingTime '{"id": "id", "plantingTime": plantingTime}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet
```

* setFertilizerType
```
near call $CONTRACT setFertilizerType '{"id": "id", "fertilizerType": fertilizerType}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet
```

* setLocation
```
near call $CONTRACT setLocation '{"id": "id", "location": location}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet
```

* setDateOfArrival
```
near call $CONTRACT setDateOfArrival '{"id": "id", "dateOfArrival": dateOfArrival}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet
```

* setRemainingLife
```
near call $CONTRACT setRemainingLife '{"id": "id", "remainingLife": remainingLife}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet
```

* buyPlant(you can buy as a customer)
```
near call $CONTRACT buyPlant '{"id": "id"}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet
```

* findPlantById
```
near call $CONTRACT findPlantById '{"id": "id"}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet
```

* findPlantById
```
near call $CONTRACT findPlantById '{"id": "id"}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet
```