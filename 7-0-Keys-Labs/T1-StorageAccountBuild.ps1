
$rg_name='rg-dev-az204-stu'
$sto_name='stodevaz204stupow'
$locat='eastus2'
$sku='Standard_LRS'
$kind='StorageV2'
Connect-AzAccount
Set-AzContext $subs
New-AzStorageAccount -ResourceGroupName $rg_name -Name $sto_name -Location $locat -SkuName $sku -Kind $kind 
Get-AzStorageAccountKey -ResourceGroupName $rg_name -Name $sto_name
