## to find files updated last few hours
# define threshold in hours to find files modified or updated in parent folder 
$modifiedFileThreshholdInHour=24

# define parent folder 
$fileParentPath="C:\Program Files"

# find files recursively to list the updated files within defined threshold under parent folder 
Get-ChildItem -Path "$fileParentPath" -Recurse -File | Foreach {
    $lastUpdateFileTime=$_.LastWriteTime
    $nowTime = get-date
    if (($nowTime - $lastUpdateFileTime).totalhours -le $modifiedFileThreshholdInHour)
    {
    	$inputFilePath=Join-Path $_.Directory  $_.Name
        # print file changed timestamp, file name and absolute file path 
        Write-Host $_.LastWriteTime, $_.Name, $inputFilePath
    }
}

## to find files updated last few minutes
# define threshold in minutes to find files modified or updated in parent folder 
$modifiedFileThreshholdInMinute=1440

# define parent folder 
$fileParentPath="C:\Program Files"

# find files recursively to list the updated files within defined threshold under parent folder 
Get-ChildItem -Path "$fileParentPath" -Recurse -File | Foreach {
    $lastUpdateFileTime=$_.LastWriteTime
    $nowTime = get-date
    if (($nowTime - $lastUpdateFileTime).totalminutes -le $modifiedFileThreshholdInMinute)
    {
    	$inputFilePath=Join-Path $_.Directory  $_.Name
        # print file changed timestamp, file name and absolute file path 
        Write-Host $_.LastWriteTime, $_.Name, $inputFilePath
    }
}
