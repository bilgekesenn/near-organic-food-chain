#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

echo
echo ---------------------------------------------------------
echo "Step 0: Check for required environment variables"
echo ---------------------------------------------------------
echo

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1

echo
echo
echo ---------------------------------------------------------
echo "Step 1: Delete $CONTRACT, setting $BENEFICIARY as beneficiary"
echo ---------------------------------------------------------
echo
near delete $CONTRACT

echo
echo ---------------------------------------------------------
echo "Step 2: Clean up project folders"
echo ---------------------------------------------------------
echo
yarn clean

exit 0