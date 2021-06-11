
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$DisplayName
)
$IdentifierUris = "http://contoso.org/exampleapp"
$HomePage = "http://contoso.org/exampleapp"



Install-Module AzureAD

Connect-AzureAD 



#Create App registration
$aadApplication = New-AzureADApplication -DisplayName $DisplayName -IdentifierUris $IdentifierUris -HomePage $HomePage




#create secret
$appObjectId=$aadApplication.ObjectId
$appPassword = New-AzureADApplicationPasswordCredential -ObjectId $appObjectId -CustomKeyIdentifier "AppAccessKey" -EndDate (Get-Date).AddYears(2)


#obtain token
$TenantId = (Get-AzureADTenantDetail).objectId
$ClientId = $aadApplication.AppId
$ClientSecret = $appPassword.value
$Resource = "https://management.core.windows.net/"
$SubscriptionId = az account show --query id -o tsv

$RequestAccessTokenUri = "https://login.microsoftonline.com/$TenantId/oauth2/token"

$body = "grant_type=client_credentials&client_id=$ClientId&client_secret=$ClientSecret&resource=$Resource"

$Token = Invoke-RestMethod -Method Post -Uri $RequestAccessTokenUri -Body $body -ContentType 'application/x-www-form-urlencoded'

Write-Host "Access Token" -ForegroundColor Red
Write-Output $Token
