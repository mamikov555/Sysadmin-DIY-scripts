# Get Balancer_Logger process
#$blogger = Get-Process -Name Balancer_logger 
#$bloggerpath = '"C:\Balancer_logger\Balancer_logger.exe"'


#$proc = Get-CimInstance Win32_Process | where commandline -match "Balancer_logger.exe"
$proc = Get-CimInstance Win32_Process | Where-Object {$_.Name -eq "Balancer_logger.exe"}


#Debug
#write-host $proc

if ($proc) {
        write-host "Stoping"
        Invoke-CimMethod -InputObject $proc -MethodName Terminate
   write-host "Process termination exectued"

        Sleep 2
   write-host "Slept for 2 seconds"
   
    $proc = Get-CimInstance Win32_Process | Where-Object {$_.Name -eq "Balancer_logger.exe"}

   write-host "Get process ID"
}

   write-host "Stoped"

   write-host "Starting"
    $app = Start-Process -FilePath "C:\Balancer_logger\Balancer_logger.exe" -PassThru
    write-host "Started. Procies ID is:" $app.Id


#Exit




