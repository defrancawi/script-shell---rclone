
CD "C:\rclone\log_bkp" 
$SourceFile = "C:\rclone\log_bkp\log.txt"
$TargetFile = "C:\rclone\log_bkp\log.html" 
$File = Get-Content $SourceFile
$FileLine = @()
Foreach ($Line in $File) {
 $MyObject = New-Object -TypeName PSObject
 Add-Member -InputObject $MyObject -Type NoteProperty -Name "log" -Value $Line
 $FileLine += $MyObject
}
$FileLine | ConvertTo-Html -Property "log" -body `<H2>backup</H2>` | Out-File $TargetFile

$fromaddress = "email@seudominio.com.br"
$toaddress = "email@seudominio.com.br"
$CCaddress = ""
$BCCaddress = ""
$Subject = "email@seudominio.com.br"
$body = get-content .\log.html
$attachment = "C:\rclone\log_bkp\log.txt"
$smtpserver = "smtps.uhserver.com" #servidor de saída do email

$message = new-object System.Net.Mail.MailMessage
$message.From = $fromaddress
$message.To.Add($toaddress)
#$message.CC.Add($CCaddress) --> Take out the number sign if you have cc address
#$message.BCC.Add($BCCaddress) --> same as previuos
$message.IsBodyHtml = $True
$message.Subject = "CABEÇALHO DA MENSAGEM DE ENVIO "
#$attach = new-object Net.Mail.Attachment($attachment) --> Option to send attachment
#$message.Attachments.Add($attach) --> not used in this example
$message.body = $body
$smtp = new-object Net.Mail.SmtpClient($smtpserver, 587) #servidor e porta de saída do email
$smtp.EnableSsl = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential(“email@seudominio.com.br”, “suaSenha”);
$smtp.Send($message)
remove-item .\log.html
Rename-Item Log.txt "Log $(Get-Date -UFormat "%d-%m-%Y").txt"





