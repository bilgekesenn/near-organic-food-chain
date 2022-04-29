#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

echo
echo ---------------------------------------------------------
echo "Step 0: Check for environment variable with contract name"
echo ---------------------------------------------------------
echo

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$CONTRACT" ] || echo "Found it! \$CONTRACT is set to [ $CONTRACT ]"

echo
echo
echo
echo To See Menu

near call $CONTRACT menu --accountId <YOUR_TESTNET_ACCOUNT>.testnet


echo "Enter As (farmer,store,customer)"

near call $CONTRACT enterAs '{"user": "user_name"}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet


echo "createPlant (as a farmer you can create plant)"

near call $CONTRACT createPlant '{"desc": "description", "price": price}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet


echo "setPlantingTime"

near call $CONTRACT setPlantingTime '{"id": "id", "plantingTime": plantingTime}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet


echo "setFertilizerType"

near call $CONTRACT setFertilizerType '{"id": "id", "fertilizerType": fertilizerType}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet


echo "setLocation"

near call $CONTRACT setLocation '{"id": "id", "location": location}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet


echo "setDateOfArrival"

near call $CONTRACT setDateOfArrival '{"id": "id", "dateOfArrival": dateOfArrival}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet


echo "setRemainingLife"

near call $CONTRACT setRemainingLife '{"id": "id", "remainingLife": remainingLife}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet


echo "buyPlant(you can buy as a customer)"

near call $CONTRACT buyPlant '{"id": "id"}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet


echo "findPlantById"

near call $CONTRACT findPlantById '{"id": "id"}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet


echo "findPlantById"

near call $CONTRACT findPlantById '{"id": "id"}' --accountId <YOUR_TESTNET_ACCOUNT>.testnet

echo
echo

# the following line fails with an error because we can't write to storage without signing the message
# --> FunctionCallError(HostError(ProhibitedInView { method_name: "storage_write" }))
# near view $CONTRACT write '{"key": "some-key", "value":"some value"}'
near call $CONTRACT write '{"key": "some-key", "value":"some value"}' --accountId $CONTRACT

echo
echo "now run this script again to see changes made by this file"
exit 0