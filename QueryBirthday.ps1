$SQLServer = "10.71.99.2"
$db3 = "NewSmapan"
$todaymonth=get-date -Format "MM"
$todayday=get-date -Format “dd”
$formatfile = get-date -Format “ddMMyyyy dddd”
$formatfile = ".\$formatfile.txt"
#$qcd = "Select * from view_happybirthdaytable where BODMonth='$todaymonth' and BODDay='$todayday'"
$qcd = "Select EmployeeName, StaffEmail, BirthDate from ViewPersonal_for_Dashboard where staffemail is not null and month(birthdate)='$todaymonth' and day(birthdate)='$todayday'"
Write-Host "Query 3:"
#$databases = Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db3 -Query $qcd -Username "happybirthdaymailer" -Password "happybirthdaymailer.." 
$databases = Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db3 -Query $qcd -Username "JPANSrv" -Password "dgd(2021)"
foreach ($database in $databases) #for each separate server / database pair in $databases
{
$CH_NAME = $database.EmployeeName #instance from the select query
$CH_EMAIL = $database.StaffEmail #databasename from the select query
Write-Output "$CH_NAME $CH_EMAIL"
invoke-expression -Command ".\_from-KPPAN\Birthday_KPPAN.ps1  '$CH_NAME' $CH_EMAIL"
invoke-expression -Command ".\_from-SKN\Birthday_SKN.ps1  '$CH_NAME' $CH_EMAIL"
Add-Content $formatfile "$CH_NAME $CH_EMAIL"
} #end foreach loop
Write-Output $todaymonth $todayday