
resource kv 'Microsoft.KeyVault/vaults@2021-06-01-preview' existing = {
  name: 'cloudburst-kv'
}

module sqlserver 'sql.bicep' = {
  name: 'sql-deploy'
  params: {
    adminName: 'sysadmin'
    adminPassword: kv.getSecret('sqlPassword')
  }
}
