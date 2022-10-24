# My setup method in detail. Please enjoy! /noopman

<#

While testing this, on my demo machine I installed:

* Clean Windows 11
* PowerShell 7 (latest version)

From this very blank slate I in stall below:

* VS Code
    There are of course many VS Code extensions I use, 
    but that setup is very specific to the user and what code they work on.
    You use your own setup for that. Let me know by commenting if you want to see my list!

* Git for windows
#>

# Ensure I can install remote modules.
Set-Executionpolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# In case you need to update to the latest Powershell version:
$PSVersionTable
winget search Microsoft.PowerShell
winget show Microsoft.PowerShell --versions
# This will install with some added installer settings.
winget install --id Microsoft.Powershell --source winget --override '/SILENT /mergetasks="addopenherecontextmenus,addrunwithpowershell7contextmenu"'
# Clean default install
winget install --id Microsoft.Powershell --source winget

# Reboot

# Default terminal:
# In Windows Terminal (WT) settings set "Defaulte terminal Application" to WT!

# Visual Studio Code
winget show Microsoft.VisualStudioCode --versions
# Fetch and install Visual Studio Code
winget install Microsoft.VisualStudioCode --source winget --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'
# To not start VS Code after install.
winget install Microsoft.VisualStudioCode --source winget --override '/SILENT /mergetasks="addcontextmenufiles,addcontextmenufolders"'

<# Alternatively install VS Code using the installer using these commands:
explorer https://code.visualstudio.com

New-Item -ItemType Directory -Path 'c:\temp'
Invoke-WebRequest -Uri 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user' -OutFile 'c:\temp\vscode.exe'
c:\temp\vscode.exe
#>

<# Change an incorrect default in VS Code.

When you execute code from a script file in VS Code
the default behaviour is to focus on the command prompt.
This is quite annoying when you want to use F8 to execute a partial script.
If you have your cursor on a given line and hit F8 VS Code PowerShell extension will execute that line.
Try below by putting your cursor on the following line and hitting the F8 button:
#>
Write-Host 'This line will execute and focus is now in the console window.'
<#
Standard behaviour when executing the above is that this text window loses focus.
Focus is set to the console window.
Now you have to click back into this file to continue developing a script.
That's annoying.

Instead configure VS Code with this setting!
Open the VS Code settings file and add the following:

"powershell.integratedConsole.focusConsoleOnExecute": false,

Now execute the next line, or two lines if you like by selecting the text of the lines:
#>
Write-Host 'This line will execute and focus remains in this window!'
Write-Host 'You can either execute the line where your cursor is blinking or a selection of script.'

# Install Git
winget install --id Git.Git -e --source winget

# OR install Git manually
https://git-scm.com/download/win
# Download and install.
# Reboot shell for path to be updated.

# Configure your git user email and name:
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# WT can now run git.
git

# Set up a location for where you develop code
New-Item -ItemType Directory -Path c:\code
Set-Location c:\code

# Check to see what profile file you use.
# Note in WT and in Code you will use the same PS7 setup.
$profile | Format-List -Force

# Create a profile file for custom settings.
notepad $profile
# Insert this in the file and save.
Set-Location c:\code
# Reload your profile.
. $profile

# Fetch this script to your machine
git clone https://github.com/noopman/I.CMD.you.to.develop.fast.in.Azure.git
code c:\code\I.CMD.you.to.develop.fast.in.Azure
Set-Location c:\code\I.CMD.you.to.develop.fast.in.Azure

# I use one specific cmdlet from PowerShellCookbook called Show-Object.
# It shows a json-object graphically.
Install-Module -Name PowerShellCookbook -AllowClobber -Force
Import-Module -Name PowerShellCookbook
$someObject = Get-Item .
$someObject
# This will show the object in a nice way which you can browse:
Show-Object $someObject

# Install PSReadLine!
pwsh.exe -noprofile -command "Install-Module PSReadLine -Force -SkipPublisherCheck -AllowPrerelease"
Get-Module | Where-Object { $_.Name -EQ 'PSReadLine' } | Format-Table Name, Version
explorer "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine"

# Install CaskaydiaCove NF or Cascadia Code PL fonts.
explorer https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip
explorer https://github.com/microsoft/cascadia-code/releases #PL = Power Line
# Download and extract zip.
# Install the ttf fonts.

<# Open WT settings and add the font to the default profile.
"profiles": {
        "defaults": {
            // Put settings here that you want to apply to all profiles.
            "font":{
                "face": "CaskaydiaCove NF",
                "size": 14
            }
        },
#>

<# Add the same font in the VS Code settings file:
"terminal.integrated.fontFamily": "CaskaydiaCove NF",
"terminal.integrated.fontSize": 14
#>

# Terminal icons makes it easier to see what files you have in a folder.
Install-Module -Name Terminal-Icons -AllowClobber -Force
notepad $profile
# Insert this + save
Import-Module -Name Terminal-Icons
# Reload your profile.
. $profile

# Install oh-my-posh
explorer https://ohmyposh.dev/docs/installation/windows
# Either
winget install JanDeDobbeleer.OhMyPosh --source winget
# Or download and install manually.
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
# Restart terminal

# Where is it oh-my-posh installed?
(Get-Command oh-my-posh).Source

# What shell am I running?
oh-my-posh get shell

# Here is how to install a prompt theme. I show how to install my theme below.
explorer https://ohmyposh.dev/docs/installation/prompt

# Install my theme
Copy-Item C:\code\I.CMD.you.to.develop.fast.in.Azure\oh-my-posh\noopman.omp.json (Get-Item $env:POSH_THEMES_PATH)

# To set the noopman theme as your default:
notepad $profile
# Add this to the profile file and save
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\noopman.omp.json" | Invoke-Expression
# Reload the profile in your terminal window
. $profile

# Alternatively you pick and potentially modify any existing theme you like:
Get-Command -Module oh-my-posh-core # You find a Get-PoshThemes command.
Get-PoshThemes
# You can also browse themes here:
explorer https://ohmyposh.dev/docs/themes

<# Here are some other "good" vs code settings I use:
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
    "editor.linkedEditing": true,
    "editor.fontLigatures": true,
    "markdown.preview.fontSize": 16,
    "debug.console.fontSize": 16,
    "editor.fontSize": 16,
    "files.autoSave": "afterDelay",
    "azureResourceGroups.groupBy": "resourceGroup"
}
#>

<# VS Code in full code window.

When you work in VS code use this shortcut to maximize the code window:

ctrl+k, z

Toggle ternimal with:

ctrl+j

Toggle file window with:

ctrl+b

Open the command palette with:

ctrl+shift+p

#>

######################
# The repo where you can get it all! Please enjoy, reuse, and share! ;~)
explorer https://github.com/noopman/I.CMD.you.to.develop.fast.in.Azure

# Thanks for reaching this far. I hope this is useful to you! /noopman