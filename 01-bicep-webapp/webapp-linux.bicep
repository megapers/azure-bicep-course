param webAppName string = uniqueString(resourceGroup().id) // Generate unique String for web app name
param sku string = 'F1' // The SKU of App Service Plan (F1 = Free Tier)
param location string = 'canadacentral' // Location for all resources

var appServicePlanName = toLower('AppServicePlan-${webAppName}')
var webSiteName = toLower('wapp-${webAppName}')

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: sku
    tier: 'Free'
  }
  properties: {
  }
}

resource appService 'Microsoft.Web/sites@2023-12-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      netFrameworkVersion: 'v4.8'
    }
  }
}
