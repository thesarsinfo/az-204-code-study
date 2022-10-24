#/bin/bash
rgname="$(az group list --query "[?contains(name, 'az204') == \`true\`].name" -o tsv)"

printf '\n O nome do resource group: '"$rgname"'\n' 

if [ "$rgname" != "rg-az204cert-westus2" ]
  then
  rgname='rg-az204cert-westus2'
  location="westus2"
  az group create -n $rgname -l $location
  fi

az deployment group create -n storagebicep -g $rgname --template-file storage.bicep
stoaccount="$(az storage account list -g $rgname --query [0].name -o tsv)"
echo $stoaccount
az storage account management-policy create -g $rgname --account-name $stoaccount \
--policy @policyteste.json 
    
 
  