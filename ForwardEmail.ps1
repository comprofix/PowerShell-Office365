#Declare Parameters
param(
  [Parameter(Mandatory=$true)]
  [string]$From,
  [Parameter(Mandatory=$true)]
  [string]$To,
  [switch]$Deliver
)

if ($Deliver) {
  Set-Mailbox $From -ForwardingAddress $To -DeliverToMailboxAndForward $true -Confirm:$false
}
else
{
  Set-Mailbox $From -ForwardingAddress $To -DeliverToMailboxAndForward $true -Confirm:$false
}
