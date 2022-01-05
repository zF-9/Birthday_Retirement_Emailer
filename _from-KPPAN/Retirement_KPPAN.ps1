$happyName=$args[0]
$happyEmail=$args[1]

#change $From to KPPAN distinct email from sabah.net
$From = "digitalisation@sabah.gov.my" 

$To = $happyEmail
#$Cc = "csd@sabah-net.com"

#change $Subject to greetings from KPPAN
$Subject = "Happy Retirement $happyName!"

#################################################################
# 	   add images & include in args - Attachments		#
#################################################################

#Declare Report as an array for multiple attachments
$Report = @()

$AnotherReport = ".\_from-KPPAN\retirekppan1.jpg"
$Report += $AnotherReport

$AnotherReport = ".\_from-KPPAN\retirekppan2.jpg"
$Report += $AnotherReport

#################################################################

# change <$SMTPServer> and <$SMTPPort> to physical sever and port
$SMTPServer = "smtp.sabah.gov.my"
$SMTPPort = "25"

# change <.html> in get-content to template accordingly 
$Body = Get-Content '.\_from-KPPAN\retire-kppan.html' | Out-String 
#".\Happy_retirement.html"
$Body = $Body -replace "NameToReplace", $RetireeName

Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -port $SMTPPort -Attachments $Report
