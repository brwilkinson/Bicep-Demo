param (
    [string]$Artifacts = (Get-Item -Path "$PSScriptRoot\.."),
    [string]$Subscription = "ES-CE-LR-INT-ZTROCINSKI",
    [string]$Region,
    [string]$RGName
)

$Params = @{
    ResourceGroupName     = $RGName
    TemplateParameterFile = "$Artifacts\bicep\0-param-dev-env.json"
    Verbose               = $true
    WhatIf                = $false
}

Set-AzContext -Subscription $Subscription

New-AzResourceGroup -Name $RGName -Location $Region -Force

New-AzResourceGroupDeployment @Params -TemplateFile .\bicep\ALL.bicep