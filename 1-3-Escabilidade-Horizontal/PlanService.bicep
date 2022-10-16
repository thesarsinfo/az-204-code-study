var Location = 'eastus2'
resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'plan-az204-test-eastus2-0001'
  location: Location
  sku: {
    name: 'S1'
    capacity: 1
  }
}
