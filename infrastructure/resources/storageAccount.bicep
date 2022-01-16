@allowed([
  'dev'
  'prod'
])
param environment string
param subnetId string

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: 'sagleb${environment}'
  location: 'westus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Cool'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
      virtualNetworkRules: [
        {
          id: subnetId
          action: 'Allow'
          state: 'Succeeded'
        }
      ]
    }
  }
}
