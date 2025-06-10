#
# audiodevice selection with powershell menu
# Ed. 01
#
# (c) G. Wenz
#
# 2025-06-10
#

# Ensure that all country dependent characters are shown correctly 

[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Create a list of all playback devices
$AudioDevices = Get-AudioDevice -List | where Type -like "Playback"


# Show available audio devices
Write-Host "Available Audio-Devices:"
for ($i = 0; $i -lt $AudioDevices.Count; $i++) {
    Write-Host "$($i + 1): $($AudioDevices[$i].Name)"
}

# User selection of the audio device
While ( $true ) {
    $Selection = Read-Host "Please select the number of the audio device to be used"
	
    if ($Selection -match "^\d+$" -and [int]$Selection -le $AudioDevices.Count -and [int]$Selection -gt 0 ) {
        $SelectedDevice = $AudioDevices[[int]$Selection - 1]
        Write-Host "Selected Device: $($SelectedDevice.Name)"
        $SelectedDevice | Set-AudioDevice	
	    Start-Sleep -Seconds  3
	    exit
    } else {
        Write-Host "Invalid selection, please try again!"
	    Start-Sleep -Seconds 1  
	}
}
