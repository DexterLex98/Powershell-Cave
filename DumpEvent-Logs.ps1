param($savePath,$destinationPath)
<#
.SYNOPSIS
Script which can be used for dumping event logs directly to a zip file in the provided path

.PARAMETER savePath
Directory where we want to save the temporary files

.PARAMETER destinationPath
Directory where the zip file will be saved

.EXAMPLE

PS> ./DumpEvent-Logs.ps1 -savePath C:\Users\Peter\AppData\Local\Temp -destinationPath D:\
This will save the temporary files to Temp directory and once execution is done will produce the zip file in D: drive

#>
function EventLogsDump_App($appLogPath){
Get-Eventlog -LogName application -EntryType Error,Warning | Export-Csv -Path "$($appLogPath)\application_logs.csv"
}

function EventLogsDump_System($sysLogPath){
Get-Eventlog -LogName System -EntryType Error,Warning,Information | Export-Csv -Path "$($sysLogPath)\system_logs.csv"
}
function EventLogsDump_Security($secLogPath){
Get-Eventlog -LogName Security -EntryType SuccessAudit,FailureAudit | Export-Csv -Path "$($secLogPath)\Security_logs.csv"
}

function compress_files($compressPath){
Compress-Archive -Path "$($compressPath)\*.csv" -DestinationPath "$($destinationPath)\EventLogs.zip"
}

function remove_logfiles($removePath){
Remove-Item -Path "$($removePath)\*.csv"
}

EventLogsDump_App($savePath)
EventLogsDump_System($savePath)
EventLogsDump_Security($savePath)
compress_files($savePath)
remove_logfiles($savePath)
