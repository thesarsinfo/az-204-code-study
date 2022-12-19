rg_name='rg-dev-az204-stu'
fc_name='func-dev-az204-stu-cli'
fc_ver='4'
locat='eastus2'
sku='Comsumption'
runtime='dotnet'
runtime_version='6'
so='Linux'
sto_name='stodevaz204stu'


az functionapp create -n $fc_name -g $rg_name -c $locat --runtime $runtime \
--runtime-version $runtime_version  --os-type $so --storage-account $sto_name --functions-version $fc_ver