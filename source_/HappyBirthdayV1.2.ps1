$happyName=$args[0]
$happyEmail=$args[1]
$From = “csd@sabah-net.com“
$To = $happyEmail
#$Cc = “csd@sabah-net.com“
$Subject = “Happy Birthday $happyName!”

$array = “I am enjoying my job. “, “It’s still good. “, “I’m still excited about my job. “
$work = $array[(Get-Random -Maximum $array.count)]

$array = “I am happy to be contributing.”, “I’m excited to be be more self sufficient every week.”, “I am looking forward to getting more into the reporting tickets.” , “I am excited to be working on more difficult tickets”
$work += $array[(Get-Random -Maximum $array.count)]

$array = “I am enjoying being here. “, “My relationship with the department is still good. “, “I enjoy working with my coworkers. “
$department = $array[(Get-Random -Maximum $array.Count)]

$array = “I appreciate how much work the company puts into the culture.”, “I am excited that I am starting to help others out.”, “I am happy that I have been able to help others in the department.”
$department += $array[(Get-Random -Maximum $array.Count)]
$Report = @(".\84781614137080771.jpg") 

#$AnotherReport = ".\71811612086375053.png"
#$Report += $AnotherReport


$AnotherReport = ".\80421614136921290.png"
$Report += $AnotherReport

$AnotherReport = ".\11321614136980075.png"
$Report += $AnotherReport

$AnotherReport = ".\3561614137137900.png"
$Report += $AnotherReport

$AnotherReport = ".\67391614137128088.png"
$Report += $AnotherReport


$AnotherReport = ".\79161614137144184.png"
$Report += $AnotherReport





$AnotherReport = ".\globe-circle-colored.png"
$Report += $AnotherReport

$AnotherReport = ".\facebook-circle-colored.png"
$Report += $AnotherReport



$SMTPServer = “smtp.sabah.gov.my”
$SMTPPort = “25”


$Body = Get-Content '.\Happy Birthday 1.html' | Out-String
$Body = $Body -replace "NameToReplace", $happyName

Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -port $SMTPPort -Attachments $Report
