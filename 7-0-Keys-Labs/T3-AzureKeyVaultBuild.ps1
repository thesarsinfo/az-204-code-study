
$rg_name='rg-dev-az204-stu'
$kv_name='kv-dev-az204-stu-pow'
$locat='eastus2'
$sku='Standard'
$day='7'

# Connect-AzAccount
# Set-AzContext $subs
New-AzKeyVault  -ResourceGroupName $rg_name -Name $kv_name -Location $locat -Sku $sku -SoftDeleteRetentionInDays $day