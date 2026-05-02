. $PSScriptRoot\..\Setup.ps1 #-ModuleMode

function Install-SSHClient {
    #======================================================================
    # Démarrage en admin :
    #======================================================================
    $principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if (-not $principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
        Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSScriptRoot\Module.ps1`"" -Verb RunAs
        #Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"; Pause" -Verb RunAs
        exit
    }
    $compt = 0

    Show-SectionHeader "Installation OpenSSH Client"
    #======================================================================
    # Installation OpenSSH Client :
    #======================================================================
    $sshClient = Get-WindowsCapability -Online |
        Where-Object { $_.Name -like "OpenSSH.Client*" }

    if (-not $sshClient) {
        Write-Status ERROR "Impossible de récupérer l'état du client OpenSSH"
        return
    }

    $sshAgent = Get-Service -Name 'ssh-agent' -ErrorAction SilentlyContinue

    if ($sshClient.State -eq "NotPresent") {
        Write-Host ""
        Write-Status INFO "OpenSSH Client non présent, installation..."
        Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0 -ErrorAction Stop
        Write-Host ""
        Write-Status SUCCESS "OpenSSH Client installé"
    }
    elseif ($sshClient.State -eq "Installed") {
        Write-Host ""
        Write-Status SKIP "OpenSSH Client déjà installé"
        $compt += 1
    }
    else {
        Write-Host ""
        Write-Status ERROR "État inattendu : $($sshClient.State)"
    }

    # --- Configuration du service ssh-agent ---
    if ($sshAgent) {
        if ($sshAgent.StartType -ne "Automatic") {
            Set-Service ssh-agent -StartupType Automatic
        }
        if ($sshAgent.Status -ne "Running") {
            Start-Service ssh-agent
        }
        else {
            Write-Host ""
            Write-Status SUCCESS "Service SSH déjà configuré"
            $compt += 1
        }
    }

    if ($compt -ne 2) {
        Write-Host ""
        Write-Status SUCCESS "OpenSSH Client installé et actif" -ForegroundColor Green
    }

    if (Test-Path "$env:USERPROFILE\.ssh\id_*") {
        Write-Host ""
        Write-Status SKIP "Clé SSH déjà présente"
    }
    else {
        Write-Host ""
        ssh-keygen
        Write-Status INFO "Génération d'une nouvelle paire de clés SSH..."
    }

    Write-Host ""
    Write-Status INFO "Ajout de la clé à l'agent SSH"
    Write-Host ""
    ssh-add

    Write-Host ""
    Write-Status INFO "Cette fenêtre se fermera automatiquement dans 10 secondes"
    Write-Host ""

    Start-Sleep 10; exit
}
Export-ModuleMember -Function Install-SSHClient
