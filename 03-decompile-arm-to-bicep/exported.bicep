param serverfarms_appserviceplan_web_21_name string
param sites_terraform_web_021_name string

resource serverfarms_appserviceplan_web_21_name_resource 'Microsoft.Web/serverfarms@2025-03-01' = {
  kind: 'linux'
  location: 'canadacentral'
  name: serverfarms_appserviceplan_web_21_name
  properties: {
    reserved: true
  }
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}

resource sites_terraform_web_021_name_resource 'Microsoft.Web/sites@2025-03-01' = {
  kind: 'app,linux'
  location: 'canadacentral'
  name: sites_terraform_web_021_name
  properties: {
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    containerSize: 0
    customDomainVerificationId: 'DF0B4BB4814E8042F44F076D46BFB6F39E274E13A710920AD11386B0425E0F63'
    dailyMemoryTimeQuota: 0
    enabled: true
    hostNameSslStates: [
      {
        hostType: 'Standard'
        name: '${sites_terraform_web_021_name}.azurewebsites.net'
        sslState: 'Disabled'
      }
      {
        hostType: 'Repository'
        name: '${sites_terraform_web_021_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
      }
    ]
    hostNamesDisabled: false
    httpsOnly: false
    hyperV: false
    isXenon: false
    keyVaultReferenceIdentity: 'SystemAssigned'
    redundancyMode: 'None'
    reserved: true
    scmSiteAlsoStopped: false
    serverFarmId: serverfarms_appserviceplan_web_21_name_resource.id
    siteConfig: {
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      functionAppScaleLimit: 0
      http20Enabled: false
      minimumElasticInstanceCount: 0
      numberOfWorkers: 1
    }
    storageAccountRequired: false
  }
}

resource sites_terraform_web_021_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2025-03-01' = {
  parent: sites_terraform_web_021_name_resource
  name: 'ftp'
  properties: {
    allow: true
  }
}

resource sites_terraform_web_021_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2025-03-01' = {
  parent: sites_terraform_web_021_name_resource
  name: 'scm'
  properties: {
    allow: true
  }
}

resource sites_terraform_web_021_name_web 'Microsoft.Web/sites/config@2025-03-01' = {
  parent: sites_terraform_web_021_name_resource
  name: 'web'
  properties: {
    acrUseManagedIdentityCreds: false
    alwaysOn: false
    autoHealEnabled: false
    azureStorageAccounts: {}
    cors: {
      supportCredentials: false
    }
    defaultDocuments: []
    detailedErrorLoggingEnabled: false
    experiments: {
      rampUpRules: []
    }
    ftpsState: 'AllAllowed'
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    http20Enabled: false
    httpLoggingEnabled: false
    ipSecurityRestrictions: [
      {
        action: 'Allow'
        description: 'Allow all access'
        ipAddress: 'Any'
        name: 'Allow all'
        priority: 1
      }
    ]
    loadBalancing: 'LeastRequests'
    localMySqlEnabled: false
    logsDirectorySizeLimit: 35
    managedPipelineMode: 'Integrated'
    minTlsVersion: '1.2'
    minimumElasticInstanceCount: 0
    netFrameworkVersion: 'v4.0'
    numberOfWorkers: 1
    preWarmedInstanceCount: 0
    publishingUsername: '$terraform-web-021'
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    requestTracingEnabled: false
    scmIpSecurityRestrictions: [
      {
        action: 'Allow'
        description: 'Allow all access'
        ipAddress: 'Any'
        name: 'Allow all'
        priority: 1
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    scmMinTlsVersion: '1.0'
    scmType: 'LocalGit'
    use32BitWorkerProcess: false
    virtualApplications: [
      {
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
        virtualPath: '/'
      }
    ]
    vnetPrivatePortsCount: 0
    vnetRouteAllEnabled: false
    webSocketsEnabled: false
  }
}

resource sites_terraform_web_021_name_sites_terraform_web_021_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2025-03-01' = {
  parent: sites_terraform_web_021_name_resource
  name: '${sites_terraform_web_021_name}.azurewebsites.net'
  properties: {
    hostNameType: 'Verified'
    siteName: 'terraform-web-021'
  }
}
