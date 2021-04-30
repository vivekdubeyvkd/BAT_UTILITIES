REM ==================================================================================================
REM import signing PFX cert on any machine
REM this script creates powershell script on the fly and uses powershell commands to import PFX on a machine
REM ==================================================================================================

REM define below env variables
set POWERSHELL_SCRIPT=%CD%\import_pfx_cert.ps1
set PFX_CERT_DIR="<root dir>\mycert.pfx"
set PFX_CERT_PASSWORD=mycertpassword

REM creating import cert powershell script
(echo Get-ChildItem -Path Cert:\LocalMachine\My | where {$_.subject -match "Intuit, Inc." } ^| Remove-Item
echo $certPass = ConvertTo-SecureString -String "$env:PFX_CERT_PASSWORD" -Force -AsPlainText
echo $User = "vivek"
echo $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $User, $certPass
echo Import-PfxCertificate -FilePath "$env:PFX_CERT_DIR" -CertStoreLocation Cert:\LocalMachine\My -Password $Cred.Password ) > %POWERSHELL_SCRIPT%

REM running powershell script to import PFX certificate
powershell %POWERSHELL_SCRIPT%

REM ==================================================================================================
