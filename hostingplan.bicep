param hostingPlanName string
param location string = resourceGroup().location
param skuName string = 'F1'
param skuCapacity int = 1

resource hostingPlan 'Microsoft.Web/serverfarms@2021-01-01' = {
  name: hostingPlanName
  location: location
  sku: {
    name: skuName
    capacity: skuCapacity
  }
  properties: {
    reserved: false
  }
}
