param namePrefix string = 'cb'
param location string = resourceGroup().location

var stgName = '${namePrefix}${uniqueString(resourceGroup().id)}st'

resource stg 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: stgName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output resourceId string = stg.id
