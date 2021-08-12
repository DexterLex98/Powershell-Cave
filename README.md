# DumpEvent-Logs - Powershell Cave

Powershell Cave is currently having a single script which is targeted for Windows.

## Lets talk about DumpEvent-Logs

DumpEvent-Logs.ps1 is targeted towards dumping Windows Event Logs which are very handy for analysis. Well DumpEvent-Logs will require **-savePath**
which is a Temp directory for creating temporary extractions and another parameter is required named **-destinationPath** which will store the logs to a certain directory which the user provides, once the whole process is executed the script will generate the **Event-Logs.zip** file.

## Example
`PS> ./DumpEvent-Logs -savePath C:\Users\Peter\AppData\Local\Temp -destinationPath D:\`

The above example demonstrates how to execute the script.
- Note: **If you're having issue running the script run it using `powershell.exe -ExecutionPolicy bypass` the following will help user run scripts**