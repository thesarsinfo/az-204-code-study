targetScope = 'resourceGroup'

param location string = 'westus2'
param sto string = 'sto'

resource storage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: '${sto}az204cert${location}i0001'
  location: location
  kind: 'BlockBlobStorage'  
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'    
  }
}
