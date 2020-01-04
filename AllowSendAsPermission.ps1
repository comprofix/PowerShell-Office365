#Declare Parameters
param(
  [Parameter(Mandatory=$true)]
  [string]$User,

  [Parameter(Mandatory=$true)]
  [string]$Mailbox

)

Get-Mailbox $Mailbox | Add-ADPermission -User $User -ExtendedRights "Send As"
