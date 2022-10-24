targetScope = 'resourceGroup'
param location string = 'westus2'
param sto string = 'sto'

resource storagev2standard 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: '${sto}az204cert${location}i0001'
  location: location
  kind: 'BlobStorage'
  sku: {
    name: 'Standard_LRS'        
  }
  properties: {
    accessTier:'Hot'

  }
}
resource blobStorageService 'Microsoft.Storage/storageAccounts/blobServices@2022-05-01' = {
  parent:storagev2standard  
  name: 'default'
  properties:{
    lastAccessTimeTrackingPolicy:{
      enable: true
      blobType:[
        'blockBlob'
      ]
      name:'AccessTimeTracking'
      trackingGranularityInDays:1
    }
  }
}



 