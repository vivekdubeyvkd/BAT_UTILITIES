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

# below code finds the directories with recent creation/update operations and might help to understand modified folders in case of manual copy paste of files to share
Get-ChildItem -Path "$fileParentPath" | Foreach {
    $lastUpdateFolderTime=$_.LastWriteTime
    $nowTime = get-date
    if (($nowTime - $lastUpdateFolderTime).totalhours -le $modifiedFileThreshholdInHour)
    {
    	$inputFolderPath=$fileParentPath + "\" + $_.Name
        # print directory changed timestamp, directory name and absolute directory path 
        Write-Host $_.LastWriteTime, $_.Name, $inputFolderPath
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

# below code finds the directories with recent creation/update operations and might help to understand modified folders in case of manual copy paste of files to share
Get-ChildItem -Path "$fileParentPath" | Foreach {
    $lastUpdateFolderTime=$_.LastWriteTime
    $nowTime = get-date
    if (($nowTime - $lastUpdateFolderTime).totalminutes -le $modifiedFileThreshholdInMinute)
    {
    	$inputFolderPath=$fileParentPath + "\" + $_.Name
        # print directory changed timestamp, directory name and absolute directory path 
        Write-Host $_.LastWriteTime, $_.Name, $inputFolderPath
    }
}



