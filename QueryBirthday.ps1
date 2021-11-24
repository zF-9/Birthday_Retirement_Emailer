$SQLServer = "10.250.1.221"
$db3 = "SabahNet"
$todaymonth=get-date -Format "MM"
$todayday=get-date -Format “dd”
$formatfile = get-date -Format “ddMMyyyy dddd”
$formatfile = ".\$formatfile.txt"
$qcd = "Select * from view_happybirthdaytable where BODMonth='$todaymonth' and BODDay='$todayday'"
Write-Host "Query 3:"
$databases = Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db3 -Query $qcd -Username "happybirthdaymailer" -Password "happybirthdaymailer.." 
foreach ($database in $databases) #for each separate server / database pair in $databases
{
$CH_NAME = $database.CH_NAME #instance from the select query
$CH_EMAIL = $database.CH_EMAIL #databasename from the select query
Write-Output "$CH_NAME $CH_EMAIL"
invoke-expression -Command ".\Birthday_KPPAN.ps1  '$CH_NAME' $CH_EMAIL"
invoke-expression -Command ".\Birthday_SKN.ps1  '$CH_NAME' $CH_EMAIL"
Add-Content $formatfile "$CH_NAME $CH_EMAIL"
} #end foreach loop
Write-Output $todaymonth $todayday