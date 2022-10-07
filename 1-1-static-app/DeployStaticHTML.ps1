$enviroment = '-az204-dev-'
$location = 'eastus2'
$app_instance = '0001'
$app_name = 'sapp' + $enviroment + $location + $app_instance
$rg_name = 'rg' + $enviroment + $location
az group create -n $rg_name -l $location
az webapp up -g $rg_name -n $app_name -l $location --sku B1 --html
