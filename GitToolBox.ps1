#======================================================================
# Importation des modules
#======================================================================
. $PSScriptRoot\src\Setup.ps1 -LogName $PSCommandPath
Import-Module "$PSScriptRoot\src\InstallGit.psm1" -Force -DisableNameChecking
Import-Module "$PSScriptRoot\src\CloneRepo.psm1" -Force -DisableNameChecking
Import-Module "$PSScriptRoot\src\RemoveRepo.psm1" -Force -DisableNameChecking

#======================================================================
# Affichage du menu principal
#======================================================================
function Show-Main {
    Clear-Host
    Write-Host "╔══════════════════════════════════════╗" -ForegroundColor Blue
    Write-Host "║            GITHUB TOOLKIT            ║" -ForegroundColor Blue
    Write-Host "║          WRITTEN BY 1337phtm         ║" -ForegroundColor Blue
    Write-Host "╚══════════════════════════════════════╝" -ForegroundColor Blue
    Write-Host ""
    Write-Host "[1]  Install git" -ForegroundColor DarkCyan
    Write-Host "[2]  Clone repo from user" -ForegroundColor DarkYellow
    Write-Host "[3]  Remove repo" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "[0]  Exit" -ForegroundColor DarkGray
    Write-Host ""
}


#======================================================================
# Fonction du menu principal
#======================================================================
do {
    . $PSScriptRoot\src\SearchGit.ps1
    Show-Main
    $choice = Read-Host "Choose an option"
    switch ($choice) {
        "1" { Install-Git }
        "2" { Clone-Repo }
        "3" { Remove-Repo }
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
