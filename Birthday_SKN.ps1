$happyName=$args[0]
$happyEmail=$args[1]

#change $From to SKN distinct email from sabah.net
$From = “csd@sabah-net.com“ 

$To = $happyEmail
#$Cc = “csd@sabah-net.com“

#change $Subject to greetings from SKN
$Subject = “Happy Birthday $happyName!”

#################################################################
# 	   add images & include in args - Attachments		#
#################################################################

#$AnotherReport = ".\11321614136980075.png"
#$Report += $AnotherReport

#$AnotherReport = ".\3561614137137900.png"
#$Report += $AnotherReport

#################################################################

$SMTPServer = “smtp.sabah.gov.my”
$SMTPPort = “25”

# change <.html> in get-content to template accordingly 
$Body = Get-Content '.\Happy Birthday 1.html' | Out-String 
$Body = $Body -replace "NameToReplace", $happyName

Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -port $SMTPPort -Attachments $Report
