$happyName=$args[0]
$happyEmail=$args[1]

#change $From to SKN distinct email from sabah.net
$From = "digitalisation@sabah.gov.my" 

$To = $happyEmail
#$Cc = "csd@sabah-net.com"

#change $Subject to greetings from SKN
$Subject = "Happy Birthday $happyName!"

#################################################################
# 	   add images & include in args - Attachments		#
#################################################################

#Declare Report as an array for multiple attachments
$Report = @()

$AnotherReport = ".\_from-SKN\sknbday1.png"
$Report += $AnotherReport

$AnotherReport = ".\_from-SKN\sknbday2.png"
$Report += $AnotherReport

#################################################################

# change <$SMTPServer> and <$SMTPPort> to physical sever and port
$SMTPServer = "smtp.sabah.gov.my"
$SMTPPort = "25"

# change <.html> in get-content to template accordingly 
$Body = Get-Content '.\_from-SKN\sknbday.html' | Out-String 
$Body = $Body -replace "NameToReplace", $happyName

Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -port $SMTPPort -Attachments $Report
