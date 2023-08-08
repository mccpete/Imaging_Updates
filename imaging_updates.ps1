Write-Host "Starting Post imaging Updates and checks......."

start-sleep -s 3

#Get Current Setting before change
Get-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" | select ShellFeedsTaskbarViewMode
 
#Remove News and Interest Using Powershell
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Value 2
 
#Get Current Setting after change
Get-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" | select ShellFeedsTaskbarViewMode

#Get rid of search bar
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name 'ShowTaskViewButton' -Type 'DWord' -Value 0

Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name 'SearchboxTaskbarMode' -Type 'DWord' -Value 1

#refesh taskbar process
taskkill /f /im explorer.exe

start-sleep -s 3

#restart taskbar process
start explorer.exe

write-host "Removed News and Interests"

start-sleep -s 3

start ms-settings:windowsupdate

write-host "Launched Windows Update"

cd C:\

cd "Program Files"

cd .\Dell\CommandUpdate

start-sleep -s 3

.\dcu-cli.exe /ApplyUpdates -reboot=disable

write-host "Launched Dell Command Update"

write-host "Post imaging script COMPLETED!!"