#!/bin/bash
rg_name='rg-dev-az204-stu'
kv_name='kv-dev-az204-stu-cli'
locat='eastus2'
sku='Standard'
day='7'

az keyvault create -n $kv_name -g $rg_name -l $locat --sku $sku --retention-days $day