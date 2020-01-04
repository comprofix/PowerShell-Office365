New-DistributionGroup -Name "Partners" -DisplayName "Partners" -Alias "Partners" -PrimarySmtpAddress "Partners@theinfinitygroup.net.au"
$UserList = Import-Csv .\Users.csv


foreach ($User in $UserList)
{
Add-DistributionGroupMember -Identity "Partners" -Member $User.PrimarySMTPAddress
}
