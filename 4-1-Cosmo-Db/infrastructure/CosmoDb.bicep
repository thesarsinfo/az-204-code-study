targetScope = 'resourceGroup'
param  location string = resourceGroup().location
param dbaccname string = 'cosno-dev-az204-stu'
param dbcontname string = 'cosnocont-dev-az204-stu'
param dbname string = 'cosnosql-dev-az204-stu'

resource cosmosDbAccount 'Microsoft.DocumentDB/databaseAccounts@2021-03-15' = {
  name: dbaccname
  location: location
  kind: 'GlobalDocumentDB'

  properties: {

    consistencyPolicy: {

      defaultConsistencyLevel: 'Eventual'
      maxStalenessPrefix: 100
      maxIntervalInSeconds: 5
    }
    locations: [
      {

        locationName: location
        failoverPriority: 0
        isZoneRedundant:false
      }
    ]    
    enableFreeTier:true
    connectorOffer:'Small'
    backupPolicy:{
      type: 'Periodic'
      periodicModeProperties:{
        backupRetentionIntervalInHours: 48
        backupIntervalInMinutes: 1440

      }
    }
    databaseAccountOfferType: 'Standard'
    enableAutomaticFailover: true
    cors:[
      
    ]
    capabilities: [
      {
        name: 'EnableServerless'
      }
    ]
  }
}
resource sqlDb 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2021-06-15' = {
  name: dbname
  parent:cosmosDbAccount
  properties: {

    resource: {
      id: dbname
    }
    options: {}
  }
}

resource sqlContainerName 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2021-06-15' = {
  parent: sqlDb 
  name: dbcontname
  properties: {

    resource: {
      id: dbcontname
      partitionKey: {
        paths: [
          '/categoria'
        ]
        kind: 'Hash'
      }
      indexingPolicy: {
        indexingMode: 'consistent'
        includedPaths: [
          {
            path: '/*'            
          }
        ]
        excludedPaths: [
          {
            path: '/\'_etag\'/?'
          }
        ]
      }
      conflictResolutionPolicy:{
        mode:'LastWriterWins'
        conflictResolutionPath: '/_ts'
      }
    }
    options: {}
  }
}

