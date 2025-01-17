@allowed([
  'dev'
  'prod'
])
param environment string
param resourcePostfix string
param vnetName string
param subnetId string

var planName = 'plan-badadvisor-${environment}'
var webSiteName = toLower('wapp-badadviser-${environment}-${resourcePostfix}')

resource plan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: planName
  location: resourceGroup().location
  sku: {
    tier: 'Standart'
    name: 'S1'
  }
  kind: 'linux'
  properties: {
    maximumElasticWorkerCount: 1
    reserved: true
  }
}

resource appService 'Microsoft.Web/sites@2021-02-01' = {
  name: webSiteName
  location: resourceGroup().location
  properties: {
    serverFarmId: plan.id
    enabled: true
    siteConfig: {
      linuxFxVersion: 'DOTNETCORE|5.0'
      alwaysOn: true
      vnetName: vnetName
      vnetRouteAllEnabled: true
    }
    virtualNetworkSubnetId: subnetId
  }
  identity: {
    type: 'SystemAssigned'
  }  
}
