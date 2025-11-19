param webAppName string = uniqueString(resourceGroup().id)
param sku string = 'F1'
param linuxFxVersion string = 'php|8.2'
param location string = 'canadacentral'

var appServicePlanName_var = toLower('AppServicePlan-${webAppName}')
var webSiteName_var = toLower('wapp-${webAppName}')

resource appServicePlanName 'Microsoft.Web/serverfarms@2025-03-01' = {
  name: appServicePlanName_var
  location: location
  sku: {
    name: sku
    tier: 'Free'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource webSiteName 'Microsoft.Web/sites@2025-03-01' = {
  name: webSiteName_var
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}
