#/bin/bash
rg_name="$(az group list --query "[?contains(name, 'az204')].name" -o tsv)"
printf '\n O nome do resource group:' "$rg_name"'\n' 

if [ "$rg_name" != "rg-az204cert-westus2" ]
  then
  rg_name='rg-az204cert-westus2'
  location="westus2"
  az group create -n $rg_name -l $location
  fi

az deployment group create \
  -n storagebicep \
  -g $rg_name \
  --template-file storage.bicep 
  