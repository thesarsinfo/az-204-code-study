#!/bin/bash
rg_name='rg-dev-az204-stu'
sto_name='stodevaz204stu'
locat='eastus2'
sku='Standard_LRS'
kind='StorageV2'

#az storage account create -n $sto_name -g $rg_name -l $locat --sku $sku --kind $kind
az storage account keys list -g $rg_name -n $sto_name