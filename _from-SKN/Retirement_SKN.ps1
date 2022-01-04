$happyName=$args[0]
$happyEmail=$args[1]

#change $From to KPPAN distinct email from sabah.net
$From = “csd@sabah-net.com“ 

$To = $happyEmail
#$Cc = “csd@sabah-net.com“

#change $Subject to greetings from KPPAN
$Subject = “Happy Retirement $RetireeName!”

#################################################################
# 	   add images & include in args - Attachments		#
#################################################################

$AnotherReport = ".\sknbersara1.png"
$Report += $AnotherReport

$AnotherReport = ".\sknbersara2.png"
$Report += $AnotherReport

#################################################################

# change <$SMTPServer> and <$SMTPPort> to physical sever and port
$SMTPServer = “smtp.sabah.gov.my”
$SMTPPort = “25”

# change <.html> in get-content to template accordingly 
$Body = Get-Content '.\sknretire.html' | Out-String 
#".\Happy_retirement.html"
$Body = $Body -replace "NameToReplace", $RetireeName

Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -port $SMTPPort -Attachments $Report
