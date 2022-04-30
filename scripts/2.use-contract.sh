#!/usr/bin/env bash
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1

echo
echo "First To see menu call menu() on the contract"
echo
echo "near call $CONTRACT menu"
near call $CONTRACT menu --accountId $OWNER
echo
echo
echo 'About to call enterAs() on the contract'
echo near call \$CONTRACT enterAs '{"user": "farmer"}' --accountId $OWNER
echo
echo \$CONTRACT is $CONTRACT
echo
near call $CONTRACT enterAs '{"user": "farmer"}' --accountId $OWNER
echo
echo
echo 'About to call createPlant() on the contract as description: Tomato and price: 5'
echo near call \$CONTRACT createPlant '{"desc": "Tomato", "price": "5"}' --accountId $OWNER
echo
near call $CONTRACT createPlant '{"desc": "Tomato", "price": "5"}' --accountId $OWNER
echo
echo
echo 'About to call setPlantingTime() on the contract as id: 0 and plantingTime: May 2'
echo near call \$CONTRACT setPlantingTime '{"id": 0, "plantingTime": "May 2"}' --accountId $OWNER
echo
near call $CONTRACT setPlantingTime '{"id":0, "plantingTime": "May 2"}'  --accountId $OWNER
echo
echo
echo 'About to call setFertilizerType() on the contract as id: 0 and fertilizerType:nitrogen'
echo near call \$CONTRACT setFertilizerType '{"id":0, "fertilizerType": "nitrogen"}' --accountId $OWNER
echo
near call $CONTRACT setFertilizerType '{"id":0, "fertilizerType": "nitrogen"}'  --accountId $OWNER
echo
echo
echo 'About to call setLocation() on the contract as id: 0 and location:Çanakkale'
echo near call \$CONTRACT setLocation '{"id": "id", "location": "Çanakkale"}' --accountId $OWNER
echo
near call $CONTRACT setLocation '{"id":0, "location": "Çanakkale"}'  --accountId $OWNER
echo
echo
echo 'About to call setHarvestTime() on the contract as id: 0 and harvestTime: August 12'
echo near call \$CONTRACT setHarvestTime '{"id":0,"harvestTime":"August 12"}' --accountId $OWNER
echo
near call $CONTRACT setHarvestTime '{"id":0,"harvestTime":"August 12"}'  --accountId $OWNER
echo
echo
echo 'About to call enterAs() on the contract as store after order from farmer'
echo near call \$CONTRACT enterAs '{"user": "store"}' --accountId $OWNER
echo
echo
near call $CONTRACT enterAs '{"user": "store"}' --accountId $OWNER
echo
echo
echo 'About to call setDateOfArrival() on the contract as id: 0 and dateOfArrival: August 14'
echo near call \$CONTRACT setDateOfArrival '{"id":0, "dateOfArrival": "August 14"}' --accountId $OWNER
echo
near call $CONTRACT setDateOfArrival '{"id":0, "dateOfArrival": "August 14"}'  --accountId $OWNER
echo
echo
echo 'About to call setRemainingLife() on the contract as id: 0 and "remainingLife":"5 days"'
echo near call \$CONTRACT setRemainingLife '{"id":0,"remainingLife":"5 days"}' --accountId $OWNER
echo
near call $CONTRACT setRemainingLife '{"id":0,"remainingLife":"5 days"}' --accountId $OWNER
echo
echo
echo 'About to call enterAs() on the contract as a customer after order from store'
echo near call \$CONTRACT enterAs '{"user": "customer"}' --accountId $OWNER
echo
echo
near call $CONTRACT enterAs '{"user": "customer"}' --accountId $OWNER
echo
echo
echo 'About to call getPlantInfo() on the contract as id: 0'
echo near call \$CONTRACT getPlantInfo '{"id":0}' --accountId $OWNER
echo
near call $CONTRACT getPlantInfo '{"id":0}' --accountId $OWNER
echo
echo