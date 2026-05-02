#======================================================================
# Importation des modules
#======================================================================

. $PSScriptRoot\src\Setup.ps1 -LogName Install-ToolBox
. $PSScriptRoot\src\Display.ps1
. $PSScriptRoot\src\Options.ps1



Import-Module "$PSScriptRoot\src\Git-ToolBox\InstallGit.psm1" -Force -DisableNameChecking
Import-Module "$PSScriptRoot\src\Git-ToolBox\CloneRepo.psm1" -Force -DisableNameChecking
Import-Module "$PSScriptRoot\src\Git-ToolBox\RemoveRepo.psm1" -Force -DisableNameChecking

Import-Module "$PSScriptRoot\src\SSH-ToolBox\Install-SSHClient.psm1" -Force -DisableNameChecking
Import-Module "$PSScriptRoot\src\WSL-ToolBox\Install-WSL.psm1" -Force -DisableNameChecking

#======================================================================
# Affichage du menu principal
#======================================================================
function Show-Main {
    Clear-Host
    Write-Host "╔══════════════════════════════════════╗" -ForegroundColor Blue
    Write-Host "║            INSTALL TOOLKIT           ║" -ForegroundColor Blue
    Write-Host "║          WRITTEN BY 1337phtm         ║" -ForegroundColor Blue
    Write-Host "╚══════════════════════════════════════╝" -ForegroundColor Blue
    Write-Host ""
    Write-Host "[1]  Git Toolbox" -ForegroundColor DarkCyan
    Write-Host "[2]  WSL Toolbox" -ForegroundColor DarkYellow
    Write-Host "[3]  SSH Toolbox" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "[0]  Exit" -ForegroundColor DarkGray
    Write-Host ""
}


#======================================================================
# Fonction du menu principal
#======================================================================
do {
    Show-Main
    $choice = Read-Host "Choose an option"
    switch ($choice) {
        "1" { Start-Git }
        "2" { Start-WSL }
        "3" { Start-SSH }
        "0" {
            Clear-Host
            return
        }
        default {
            Write-Status ERROR "Invalid choice."
            Pause
        }
    }
} until ($choice -eq "0")
