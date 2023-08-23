# Parameters
| Parameters   |      Description      |  Example |
|----------|:-------------|------:|
| resourceGroupName |  Name of the resource group to which the database server is assigned. | $1600 |
| serverName |    Azure SQL Database server name   |   $12 |
| databaseName | Azure SQL Database name (case sensitive). |    $1 |
| newDTU | Azure SQL Database DTU value, need to match the DTU of the tier |    Example values: 5, 10, 20, 50, 100... |

# Example
```PowerShell
./ChangeDTU.ps1 `
>>   -resourceGroupName 1-aec81472-playground-sandbox `
>>   -serverName testseergerg235rver `
>>   -databaseName testdatabase `
>>   -newDTU 20
DB name: testdatabase
Current DB status: Online, edition: Standard, tier: S1, DTU: 20
Already Database Server testseergerg235rver\testdatabase is in required DTU : 20
Final DB status: Online, edition: Standard, tier: S1, DTU: 20
Database updated successfully
```

# DTU/Tier reference
Run this command to find the tier match your DTU required:
```PowerShell
Get-AzSqlServerServiceObjective -ResourceGroupName "yourResourceGroupName" -ServerName "  -serverName "yourServerName"
" 
ServiceObjectiveName SkuName       Edition          Family Capacity CapacityUnit Enabled
-------------------- -------       -------          ------ -------- ------------ -------
System               System        System                  0        DTU          False
System0              System        System                  0        DTU          False
System1              System        System                  0        DTU          False
System2              System        System                  0        DTU          False
System3              System        System                  0        DTU          False
System4              System        System                  0        DTU          False
System2L             System        System                  0        DTU          False
System3L             System        System                  0        DTU          False
System4L             System        System                  0        DTU          False
GP_SYSTEM_2          GP_SYSTEM     System           Gen5   2        VCores       False
GP_SYSTEM_4          GP_SYSTEM     System           Gen5   4        VCores       False
GP_SYSTEM_8          GP_SYSTEM     System           Gen5   8        VCores       False
Free                 Free          Free                    5        DTU          True
Basic                Basic         Basic                   5        DTU          True
S0                   Standard      Standard                10       DTU          True
S1                   Standard      Standard                20       DTU          True
S2                   Standard      Standard                50       DTU          True
S3                   Standard      Standard                100      DTU          True
S4                   Standard      Standard                200      DTU          True
S6                   Standard      Standard                400      DTU          True
S7                   Standard      Standard                800      DTU          True
S9                   Standard      Standard                1600     DTU          True
...
```
