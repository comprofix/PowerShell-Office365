#Get-Mail Address
$UserPrincipalName = Read-Host -Prompt 'Enter Email Address for User'
$UserDisplayName = Get-Mailbox $UserPrincipalName | Select DisplayName

# Convert to Shared
write-host 'Converting' $UserPrincipalName 'to a Shared Mailbox.....' -ForegroundColor Yellow
$UserDisplayName = get-mailbox $UserPrincipalName | Select DisplayName
set-mailbox $UserPrincipalName -DisplayName "z_$UserDisplayName.DisplayName"
set-mailbox $UserPrincipalName -Type Shared

# Hide from GAL
write-host 'Hide' $UserPrincipalName 'from Global Address Book.....' -ForegroundColor Yellow
Set-Mailbox -Identity $UserPrincipalName -HiddenFromAddressListsEnabled $true

#Remove Licenses
Write-Host 'Removing any licenses on '$UserPrincipalName'...' -ForegroundColor Yellow
$UserLicenses = (Get-MsolUser -UserPrincipalName $UserPrincipalName).licenses.accountskuid
Set-MsolUserLicense -UserPrincipalName $UserPrincipalName -RemoveLicenses $UserLicenses
