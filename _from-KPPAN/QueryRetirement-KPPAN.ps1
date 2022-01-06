#$SQLServer = "10.250.1.221"
#$db3 = "SabahNet"

$SQLServer = "10.71.99.2"
$db3 = "NewSmapan"

###############################################################################################################
$todaymonth=get-date -Format "MM"
$todayday=get-date -Format "dd"

$formatfile = get-date -Format "ddMMyyyy dddd"
$formatfile = ".\$formatfile.txt"
#$qcd = "Select * from view_happybirthdaytable where BODMonth='$todaymonth' and BODDay='$todayday'"
$qcd = "Select EmployeeName, StaffEmail, BirthDate from ViewPersonal_for_Dashboard where staffemail is not null AND EmployeeIC IN ('930106125663','880621125761')"
#$qcd = "Select EmployeeName, StaffEmail, BirthDate from ViewPersonal_for_Dashboard where staffemail is not null and month(birthdate)='$todaymonth' and day(birthdate)='$todayday'"
#change <BirthDate> && month(birthdate) -> RetireDate == column name in "ViewPersonal_for_Dashboard"

###############################################################################################################
#   $qcd = <parameters on retirement date> from *DB yang ada retirement date punya information
###############################################################################################################

Write-Host "Query 3:"
$databases = Invoke-Sqlcmd -ServerInstance $SQLServer -Database $db3 -Query $qcd -Username "JPANSrv" -Password "dgd(2021)" 
foreach ($database in $databases) #for each separate server / database pair in $databases
{
$CH_NAME = $database.EmployeeName #instance from the select query
$CH_EMAIL = $database.StaffEmail #databasename from the select query
Write-Output "$CH_NAME $CH_EMAIL"

##############################################################################################################

invoke-expression -Command ".\_from-KPPAN\Retirement_KPPAN.ps1  '$CH_NAME' $CH_EMAIL"
#invoke-expression -Command ".\_from-SKN\Retirement_SKN.ps1  '$CH_NAME' $CH_EMAIL"

##############################################################################################################
#   invoke ".\<retirement_greets(SKN/KPPAN).ps1>" : change deez 
###############################################################################################################

Add-Content $formatfile "$CH_NAME $CH_EMAIL"
} #end foreach loop
Write-Output $todaymonth $todayday