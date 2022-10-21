targetScope = 'resourceGroup'
param location string = 'westus2'
param sto string = 'sto'

resource storagepremium 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: '${sto}az204cert${location}i0001'
  location: location
  kind: 'BlockBlobStorage'
  sku: {
    name: 'Premium_LRS'    
  }
  properties: {
    accessTier:'Hot'
  }
}
