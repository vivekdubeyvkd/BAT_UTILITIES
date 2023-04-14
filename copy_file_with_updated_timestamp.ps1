##########################################################################
# How to run the script:
# From admin CMD, you can run as shown below:
#    powershell .\copy_file_with_updated_timestamp.ps1 -sourceDir "C:\temp" -destDir "C:\temp\vivek" -fileName "abc.txt"
# From Powershel terminal, you can run as shown below:
#    .\copy_file_with_updated_timestamp.ps1 -sourceDir "C:\temp" -destDir "C:\temp\vivek" -fileName "abc.txt"
##########################################################################

# mandatory input parameters required by the script 
param (
    [Parameter(Mandatory=$true)][string]$sourceDir,
    [Parameter(Mandatory=$true)][string]$destDir,
    [Parameter(Mandatory=$true)][string]$fileName
)

# command to copy files from source to destination
Copy-Item "$sourceDir\$fileName" -Destination "$destDir"

# command to update the copied file time stamp to current time stamp on network share to be considered for the processing
(Get-ChildItem -Path "$destDir\$fileName") | % {$_.LastWriteTime = (Get-Date)}
