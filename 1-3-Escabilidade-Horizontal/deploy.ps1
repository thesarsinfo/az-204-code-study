$RgName = $(az group list --query "[?contains(name,'Teste') == ``true``].name" --output tsv) 
az deployment group create -g $RgName --template-file PlanService.bicep