bicep publish storage.bicep --target br:cloudburst.azurecr.io/bicep/storage:v1

$spec = @{
    ResourceGroupName = 'cloudburst-demo-rg'
    Name              = 'storage' 
    Version           = 'v1' 
    Location          = 'westeurope' 
    TemplateFile      = 'storage.json'
}

New-AzTemplateSpec @spec