#/bin/bash
rgname="$(az group list --query "[?contains(name, 'az204') == \`true\`].name" -o tsv)"
printf '\n O nome do resource group: '"$rgname"'\n' 
az group delete -n $rgname