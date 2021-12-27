@allowed([
  'dev'
  'prod'
])
param environment string

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: 'saglebv${environment}'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Cool'
  }
}
