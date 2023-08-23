# How to use
## Create the Hosting Plan
```PowerShell
New-AzResourceGroupDeployment `
-ResourceGroupName 1-aec81472-playground-sandbox `
-TemplateFile hostingplan.bicep `
-hostingPlanName testHostingPlan


DeploymentName          : hostingplan
ResourceGroupName       : 1-aec81472-playground-sandbox
ProvisioningState       : Succeeded
Timestamp               : 8/23/2023 4:29:08 PM
Mode                    : Incremental
TemplateLink            :
Parameters              :
                          Name               Type                       Value
                          =================  =========================  ==========
                          hostingPlanName    String                     "testHostingPlan"
                          location           String                     "southcentralus"
                          skuName            String                     "F1"
                          skuCapacity        Int                        1

Outputs                 :
DeploymentDebugLogLevel :
```

## Create the WebApp
```PowerShell
New-AzResourceGroupDeployment `
 -ResourceGroupName 1-aec81472-playground-sandbox `
 -TemplateFile main.bicep `
 -hostingPlanName testHostingPlan `
 -project datawv `
 -env test


DeploymentName          : main
ResourceGroupName       : 1-aec81472-playground-sandbox
ProvisioningState       : Succeeded
Timestamp               : 8/23/2023 4:45:28 PM
Mode                    : Incremental
TemplateLink            :
Parameters              :
                          Name               Type                       Value
                          =================  =========================  ==========
                          hostingPlanName    String                     "testHostingPlan"
                          location           String                     "southcentralus"
                          project            String                     "datawv"
                          env                String                     "test"

Outputs                 :
                          Name             Type                       Value
                          ===============  =========================  ==========
                          webApp1Domain    String                     "webapp1-datawv-test.azurewebsites.net"
                          webApp2Domain    String                     "webapp2-datawv-test.azurewebsites.net"
                          webApp3Domain    String                     "webapp3-datawv-test.azurewebsites.net"

DeploymentDebugLogLevel :
```