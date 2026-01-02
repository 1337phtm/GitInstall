Import-Module "$PSScriptRoot\..\Git\Git.psm1"

function Show-GitMenu {
    Write-Host "[1] Install git"
    Write-Host "[2] Clone repo"
    Write-Host "[3] Remove repo"
    Write-Host "[0] Exit"

    $choice = Read-Host "Choice"

    switch ($choice) {
        1 { Install-Git }
        2 { Clone-GitRepo }
        3 { Remove-GitRepo }
        0 { return }
    }
}

Export-ModuleMember -Function Show-GitMenu
