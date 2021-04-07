if exist %userprofile%\.aws\credentials del /f %userprofile%\.aws\credentials

call aws sts assume-role --role-arn "arn:aws:iam::**********:role/poweruser" --role-session-name AWSCLI-Session>STSCred.json

(echo $json = (Get-Content "STSCred.json" -Raw^) ^| ConvertFrom-Json
echo $json.Credentials.AccessKeyId^>AKI.txt
echo $json.Credentials.SecretAccessKey^>SAK.txt
echo $json.Credentials.SessionToken^>ST.txt)>json.ps1

powershell ./json.ps1

TYPE AKI.txt>AKI-A.txt
TYPE SAK.txt>SAK-A.txt
TYPE ST.txt>ST-A.txt

SET /p AWS_ACCESS_KEY_ID=<AKI-A.txt
SET /p AWS_SECRET_ACCESS_KEY=<SAK-A.txt
SET /p AWS_SESSION_TOKEN=<ST-A.txt

del /f STSCred.json AKI.txt SAK.txt ST.txt json.ps1 AKI-A.txt SAK-A.txt ST-A.txt
