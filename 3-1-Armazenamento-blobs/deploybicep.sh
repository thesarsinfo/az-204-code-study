#/bin/bash
rgname="rg-az204cert-westus2"
location="westus2"
az group create -n $rgname -l $location
az deployment group create \
  -n storagebicep \
  -g $rgname \
  --template-file StorageAccount.bicep 
  