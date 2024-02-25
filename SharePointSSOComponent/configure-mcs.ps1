$siteUrl = "https://piasysdev.sharepoint.com/sites/HR-Copilot-Demo-Test01/"
$botUrl = "https://default6c94075ada0a4c6a8411badf652e8b.53.environment.api.powerplatform.com/powervirtualagents/botsbyschema/cr1e3_hrCopilotDemo/directline/token?api-version=2022-03-01-preview"
$botName = "HR Copilot - Demo"
$customScope = "api://botid-6393d018-1771-44f8-9e79-80cfc3195485/HR.Read"
$clientId = "46411402-7347-4607-969c-bb90eaf649bc"
$authority = "https://login.microsoftonline.com/common"
$buttonLabel = "HR Copilot"

Connect-pnponline -url $siteUrl -Credentials PiaSysDev-Paolo
$action = (Get-PnPCustomAction)[0]
$action.ClientSideComponentProperties

$action.ClientSideComponentProperties = @{
    "botURL" = $botUrl
    "customScope" = $customScope
    "clientID" = $clientId
    "authority" = $authority
    "greet" = $true
    "buttonLabel" = $buttonLabel
    "botName" = $botName
} | ConvertTo-Json -Compress

$action.Update()
Invoke-PnPQuery
