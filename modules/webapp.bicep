param webAppName string
param hostingPlanName string
param location string
param timeZone string = ''

resource webApp 'Microsoft.Web/sites@2021-01-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: hostingPlanName
    siteConfig: {
      alwaysOn: false
      websiteTimeZone : timeZone
    }
  }
}

output webAppDomain string = webApp.properties.defaultHostName
