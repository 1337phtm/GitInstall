# Create the README.md file with the improved content

# 🚀 Install-ToolBox

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207+-blue)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![License](https://img.shields.io/badge/License-MIT--Custom-green)
![Status](https://img.shields.io/badge/Status-Active-success)

---

## 📌 Description

**Install-ToolBox** est un module PowerShell conçu pour automatiser et simplifier la gestion de l’environnement de développement Git sous Windows.

Il permet non seulement de manipuler des dépôts Git (clonage, suppression, scan), mais aussi d’installer et configurer les outils essentiels comme :

- Git
- WSL (Windows Subsystem for Linux)
- Serveur (soon) & client SSH

Le tout avec une interface claire, interactive et sécurisée.

---

## 🎯 Objectifs

- ⚡ Accélérer la mise en place d’un environnement de dev
- 🔒 Sécuriser les opérations sensibles (suppression, configuration)
- 🧰 Centraliser les outils essentiels dans un seul script
- 🧑‍💻 Améliorer l’expérience utilisateur en PowerShell

---

## ✨ Fonctionnalités

### 🔍 Détection & installation de Git

- Vérifie si Git est installé
- Propose une installation automatique si absent
- Détection intelligente du chemin d’installation

### 📥 Gestion des dépôts Git

- Clonage de dépôts via utilisateur ou URL
- Vérification de validité des sources
- Création automatique des dossiers
- Retour utilisateur clair et lisible

### 🗂️ Scan avancé des dépôts

- Recherche récursive de tous les dossiers `.git`
- Scan sur tous les disques disponibles
- Exclusion des dossiers système (Windows, Program Files, etc.)
- Affichage numéroté et structuré

### 🗑️ Suppression sécurisée

- Confirmation utilisateur obligatoire
- Identification des dépôts par index
- Suppression récursive propre
- Messages explicites

### 🐧 Installation de WSL

- Installation automatique de WSL
- Préparation de l’environnement Linux

### 🔐 Configuration SSH

- Installation du client et serveur SSH
- Préparation pour connexions distantes

---

## 🖥️ Prérequis

- Windows 10 / 11
- PowerShell 5.1 ou supérieur
- Droits administrateur recommandés

---

## 📦 Installation

```powershell
git clone https://github.com/1337phtm/Install-ToolBox
cd Install-ToolBox
./Main.ps1
```

## 📁 Structure du projet

```text
├── .gitignore
├── Main.ps1
├── Make-Arbo.ps1
├── README.md
└── src
    ├── Display.ps1
    ├── Options.ps1
    ├── Setup.ps1
    ├── Git-ToolBox
    │   ├── clonerepo.psm1
    │   ├── InstallGit.psm1
    │   ├── removerepo.psm1
    │   └── SearchGit.ps1
    ├── SSH-ToolBox
    │   ├── Install-sshClient.psm1
    │   └── Module.ps1
    └── WSL-ToolBox
        └── Install-WSL.psm1
```
