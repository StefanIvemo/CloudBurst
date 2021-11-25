@maxLength(5)
param namePrefix string
param location string = resourceGroup().location

var storageName = '${namePrefix}${uniqueString(resourceGroup().location)}st'

resource stg 'Microsoft.Storage/storageAccounts@2021-06-01'  = {
  name: storageName
  location: location
  sku: {
    name: 'Premium_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
