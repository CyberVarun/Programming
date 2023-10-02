Dim objShell
Set objShell = CreateObject("WScript.Shell")

url = "https://securityboat.in/"

' Open the URL in the default web browser
objShell.Run "cmd /c start " & url

Set objShell = Nothing
