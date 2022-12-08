
rgname="$(az group list --query "[?contains(name, 'stu') == \`true\`].name" -o tsv)"
az acr create -g $rgname -n acraz20401 --sku basic
az acr build  --image sample/dotnet:7.0 --registry acraz20401.azurecr.io --file Dockerfile .
az acr repository list -n acraz20401.azurecr.io -o table