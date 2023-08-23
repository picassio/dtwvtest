param hostingPlanName string
param location string = resourceGroup().location
param project string
param env string

module webApp1 './modules/webapp.bicep' = {
  name: 'webApp1Module'
  params: {
    webAppName: 'webApp1-${project}-${env}'
    hostingPlanName: hostingPlanName
    location: location
    timeZone: 'E. Australia Standard Time'
  }
}

module webApp2 './modules/webapp.bicep' = {
  name: 'webApp2Module'
  params: {
    webAppName: 'webApp2-${project}-${env}'
    hostingPlanName: hostingPlanName
    location: location
  }
}

module webApp3 './modules/webapp.bicep' = {
  name: 'webApp3Module'
  params: {
    webAppName: 'webApp3-${project}-${env}'
    hostingPlanName: hostingPlanName
    location: location
  }
}

output webApp1Domain string = webApp1.outputs.webAppDomain
output webApp2Domain string = webApp2.outputs.webAppDomain
output webApp3Domain string = webApp3.outputs.webAppDomain
