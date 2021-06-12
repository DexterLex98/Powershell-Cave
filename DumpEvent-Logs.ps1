
param($savePath,$destinationPath)

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
