. $PSScriptRoot\Setup.ps1 -ModuleMode

function Start-Git {
    do {
        . $PSScriptRoot\Git-ToolBox\SearchGit.ps1
        Show-GitMenu
        $choice = Read-Host "Choose an option"
        switch ($choice) {
            "1" { Install-Git }
            "2" { Clone-Repo }
            "3" { Remove-Repo }
            "0" {
                Clear-Host
                Pause
                return
            }
            default {
                Write-Status ERROR "Invalid choice."
                Stop-Screen
            }
        }
    } until ($choice -eq "0")
}

function Start-WSL {
    do {
        Show-WSLMenu
        $choice = Read-Host "Choose an option"
        switch ($choice) {
            "1" { Install-WSL }
            "2" { }
            "0" { return }
            default {
                Write-Status ERROR "Invalid choice."
                Pause
                return
            }
        }
    } until ($choice -eq "0")
}

function Start-SSH {
    do {
        Show-SSHMenu
        $choice = Read-Host "Choose an option"
        switch ($choice) {
            "1" { Install-SSHClient }
            "2" { }
            "0" { return }
            default {
                Write-Status ERROR "Invalid choice."
                Pause
                return
            }
        }
    } until ($choice -eq "0")
}


