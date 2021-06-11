
param($savePath)

function EventLogsDump_App($appLogPath){
Get-Eventlog -LogName application -EntryType Error,Warning | Export-Csv -Path "$($appLogPath)\application_logs.csv"
}

function EventLogsDump_System($sysLogPath){
Get-Eventlog -LogName System -EntryType Error,Warning | Export-Clixml -Path "$($sysLogPath)\system_logs.csv"
}

EventLogsDump_App($savePath)
EventLogsDump_System($savePath)

