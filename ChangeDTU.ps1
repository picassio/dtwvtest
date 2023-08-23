<#
.SYNOPSIS
    .PARAMETER resourceGroupName
        Name of the resource group to which the database server is assigned.
 
    .PARAMETER serverName
        Azure SQL Database server name.
 
    .PARAMETER databaseName
        Azure SQL Database name (case sensitive).
 
    .PARAMETER newDTU
        Azure SQL Database DTU value, need to match the DTU of the tier:
        Example values: 5, 10, 20, 50, 100...
 
    .EXAMPLE
        -resourceGroupName myResourceGroup `
        -serverName myserver `
        -databaseName myDatabase `
        -newDTU 20
#>

param(
    [Parameter(Mandatory=$True,Position=0)]
    [string]$resourceGroupName,
 
    [Parameter(Mandatory=$True,Position=1)]
    [string]$serverName,
 
    [Parameter(Mandatory=$True,Position=2)]
    [string]$databaseName,

    [Parameter(Mandatory=$True,Position=3)]
    [int]$newDTU
)

$sqlDB = Get-AzSqlDatabase `
-ResourceGroupName $resourceGroupName `
-ServerName $serverName `
-DatabaseName $databaseName

Write-Output "DB name: $($sqlDB.DatabaseName)"
Write-Output "Current DB status: $($sqlDB.Status), edition: $($sqlDB.Edition), tier: $($sqlDB.CurrentServiceObjectiveName), DTU: $($sqlDB.Capacity)"

if ($sqlDB.Capacity -eq $newDTU)
{
    Write-Output "Already Database Server $($ServerName)\$($DatabaseName) is in required DTU : $($newDTU)"
}
else
{
    Write-Output "Updating Database Server $($ServerName)\$($DatabaseName) to new DTU value : $($newDTU)"
    Write-Output  "Updating Database , please wait..." 
    $sqlDB | Set-AzSqlDatabase -Capacity $newDTU | out-null
}

$sqlDB = Get-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName
Write-Output "Final DB status: $($sqlDB.Status), edition: $($sqlDB.Edition), tier: $($sqlDB.CurrentServiceObjectiveName), DTU: $($sqlDB.Capacity)"

Write-Output "Database updated successfully" 