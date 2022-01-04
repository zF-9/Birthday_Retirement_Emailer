$happyName=$args[0]
$happyEmail=$args[1]

#change $From to KPPAN distinct email from sabah.net
$From = “csd@sabah-net.com“ 

$To = $happyEmail
#$Cc = “csd@sabah-net.com“

#change $Subject to greetings from KPPAN
$Subject = “Happy Birthday $happyName!”

#################################################################
# 	   add images & include in args - Attachments		#
#################################################################

#$AnotherReport = ".\assests\bdaykppan1.jpg"
#$Report += $AnotherReport

#$AnotherReport = ".\assests\bdaykppan2.jpg"
#$Report += $AnotherReport

#################################################################

# change <$SMTPServer> and <$SMTPPort> to physical sever and port
$SMTPServer = “smtp.sabah.gov.my”
$SMTPPort = “25”

# change <.html> in get-content to template accordingly 
$Body = Get-Content '.\_from-KPPAN\bday-kppan.html' | Out-String 
$Body = $Body -replace "NameToReplace", $happyName

Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -port $SMTPPort -Attachments $Report
