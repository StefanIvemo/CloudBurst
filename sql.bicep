
param adminName string
@secure()
param adminPassword string

resource sqlServer 'Microsoft.Sql/servers@2021-05-01-preview' = {
  name: 'cloudburst-sql'
  location: 'westeurope'
  properties: {
    administratorLogin: adminName
    administratorLoginPassword: adminPassword
  }
}

var dbs = [
  'db01'
  'db02'
  'db03'
]

resource sqldb 'Microsoft.Sql/servers/databases@2021-05-01-preview' = [for db in dbs:  {
  name: db
  parent: sqlServer
  location: 'westeurope'
}]
