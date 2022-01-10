param environment string 

module storageAccount 'resources/storageAccount.bicep' = {
  name: 'storageAccount-deployment'
  params: {
    environment: environment
  }
}

module appService 'resources/appService.bicep' = {
  name: 'appService-deployment'
  params: {
    environment: environment
  }
}

module VNet 'resources/vnet.bicep' = {
  name: 'vnet-deployment'
  params: {
    environment: environment
  }
}
