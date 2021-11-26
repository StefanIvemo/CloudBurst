param namePrefix string
param location string = resourceGroup().location
param skuName string = 'Standard_LRS'

var storageName_var = '${namePrefix}${uniqueString(resourceGroup().id)}st'

resource storageName 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageName_var
  location: location
  sku: {
    name: skuName
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
  }
}