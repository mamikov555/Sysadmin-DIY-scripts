<#

.SYNOPSIS
#Powershell script to ping all IP addresseses in a CSV file.
  
.DESCRIPTION
#This PowerShell script reads a CSV file and pings all the IP addresses listed in the IPAddress column.
  
.PARAMETER <csvfile>
#File name and path of the CSV file to read.
 


.EXAMPLE
#Ping-IPList c:\IPaddressList.csv
   
#>

Param(
  [Parameter(Mandatory=$true, position=2)][string]$csvfile
)
# Variables to use 
$ColumnHeaderIP = "IP"
$ColumnHeaderHname = "Name"

Write-Host "Reading file" $csvfile
$ipaddresses = import-csv $csvfile | select-object $ColumnHeaderIP
$hostname = Import-csv $csvfile  | Select-Object $ColumnHeaderHname

Write-Host "Started Pinging.."
foreach( $ip in $ipaddresses) {
    if (test-connection $ip.("IP") -count 2 -quiet) {
        write-host $ip.("IP") "Ping succeeded." -foreground green

    } else {
         write-host $ip.("IP") "Ping failed." -foreground red
    }
    
}

Write-Host "Pinging Completed."
