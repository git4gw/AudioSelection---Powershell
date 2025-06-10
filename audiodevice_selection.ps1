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

# Benutzerauswahl
$Selection = Read-Host "Please select the number of the audio device to be used: "

# Select audio device
if ($Selection -match "^\d+$" -and [int]$Selection -le $AudioDevices.Count) {
    $SelectedDevice = $AudioDevices[[int]$Selection - 1]
    Write-Host "Selected Device: $($SelectedDevice.Name)"
    $SelectedDevice | Set-AudioDevice
	Start-Pause 4
    } else {
    Write-Host "Invalid selection, please try again!"
}
