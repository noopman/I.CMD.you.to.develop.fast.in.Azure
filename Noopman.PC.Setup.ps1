# .NET CLI

# .NET CLI With Container Support

# az CLI

# azd Developer CLI

# My setup method in detail

<#

On my demo machine I have installed:
* Clean Windows 11
* PowerShell 7 (latest version)

Below follows my specific workspace setup:

First I install VS Code + Git.
There are of course many VS Code extensions I use, but that setup is
very specific to the user and what code they work on.

#>

# default terminal
# in wt settings "Defaulte terminal Application" set to Windows terminal
Set-Executionpolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Powershell version
$PSVersionTable
winget search Microsoft.PowerShell
# Update to latest version
winget install --id Microsoft.Powershell --source winget
# Reboot
# WT set PowerShell as default terminal (which sets ver 7 as default)

# Install Visual Studio Code
explorer https://code.visualstudio.com
New-Item -ItemType Directory -Path 'c:\temp'
Invoke-WebRequest -Uri 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user' -OutFile 'c:\temp\vscode.exe'
c:\temp\vscode.exe

#Install # Install Git
https://git-scm.com/download/win
# Download and install.
# Reboot for path to be updated.
# wt can now run git

# Get the code
New-Item -ItemType Directory -Path c:\code
Set-Location c:\code

#What profile do we set up? In PS and in Code?
$PROFILE | Format-List -Force

notepad $profile
<# INSERT this + SAVE
Set-Location c:\code
#>

git clone https://github.com/noopman/I.CMD.you.to.develop.fast.in.Azure.git
code c:\code\I.CMD.you.to.develop.fast.in.Azure
Set-Location c:\code\I.CMD.you.to.develop.fast.in.Azure

Install-Module -Name PowerShellCookbook -AllowClobber -Force
Import-Module -Name PowerShellCookbook
show-object (get-item .)

Install-Module -Name PSReadLine -AllowClobber -Force

Get-Module | Where-Object { $_.Name -EQ 'PSReadLine' } | Format-Table Name, Version

#PSReadLine
pwsh.exe -noprofile -command "Install-Module PSReadLine -Force -SkipPublisherCheck -AllowPrerelease"
Get-Module | Where-Object { $_.Name -EQ 'PSReadLine' } | Format-Table Name, Version
explorer "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine"

#Install CaskaydiaCove NF or Cascadia Code PL fonts
explorer https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip
explorer https://github.com/microsoft/cascadia-code/releases #PL = Power Line
#Download and extract zip
#Install the ttf fonts

<# In WT settings:

"profiles": {
        "defaults": {
            // Put settings here that you want to apply to all profiles.
            "font":{
                "face": "CaskaydiaCove NF",
                "size": 14
            }
        },

#>

<# In VS Code settings file:

"terminal.integrated.fontFamily": "CaskaydiaCove NF",
"terminal.integrated.fontSize": 14

#>

# Terminal icons makes it easier to see what files you have in a folder.
Install-Module -Name Terminal-Icons -AllowClobber -Force
notepad $profile
# Insert this + save
Import-Module -Name Terminal-Icons

# 
explorer https://ohmyposh.dev/
#winget install oh-my-posh
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
# Restart terminal

explorer https://ohmyposh.dev/docs/installation/windows
winget install JanDeDobbeleer.OhMyPosh -s winget
# Restart terminal

# Where is it oh-my-posh?
(Get-Command oh-my-posh).Source

# What shell am I running?
oh-my-posh get shell

# Here is how to install a prompt theme. I show how to install my theme below.
explorer https://ohmyposh.dev/docs/installation/prompt

Copy-Item C:\code\I.CMD.you.to.develop.fast.in.Azure\oh-my-posh\noopman.omp.json (Get-Item $env:POSH_THEMES_PATH)

# To set the noopman theme as your default:
notepad $profile
# Add this to the profile file and save
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\noopman.omp.json" | Invoke-Expression
# Reload the profile in your terminal window
. $profile

# Or pick and potentially modify any theme you like:
Get-Command -Module oh-my-posh-core # You find a Get-PoshThemes command.
Get-PoshThemes
# You can also browse themes here:
explorer https://ohmyposh.dev/docs/themes

<# VS Code settint to NOT set focus on console window on execute
Set in VS Code settings file:
"powershell.integratedConsole.focusConsoleOnExecute": false,
#>

<# Other "good" vs code settings
{
    "explorer.confirmDelete": false,
    "editor.formatOnPaste": true,
    "editor.tabSize": 2,
    "editor.insertSpaces": true,
    "git.autofetch": true,
    "git.confirmSync": false,
    "workbench.editor.highlightModifiedTabs": true,
    "files.trimFinalNewlines": true,
    "terminal.integrated.defaultProfile.windows": "PowerShell",
    "editor.fontFamily": "'Cascadia code'",
    "powershell.integratedConsole.showOnStartup": false,
    "editor.inlineSuggest.enabled": true,
    "workbench.startupEditor": "none",
    "git.enableSmartCommit": true,
    "git.smartCommitChanges": "tracked",
    "editor.formatOnType": true,
    "terminal.integrated.scrollback": 25000,
    "workbench.iconTheme": "material-icon-theme",
    "editor.linkedEditing": true,
    "editor.fontLigatures": true,
    "markdown.preview.fontSize": 16,
    "debug.console.fontSize": 16,
    "editor.fontSize": 16,
    "files.autoSave": "afterDelay",
    "security.workspace.trust.untrustedFiles": "open",
    "azureResourceGroups.groupBy": "resourceGroup"
}
#>

######################
# The repo where you can get it all! Please enjoy, reuse, and share! ;~)
explorer https://github.com/noopman/I.CMD.you.to.develop.fast.in.Azure