<# My work-computer setup in detail follwos. Please enjoy! /noopman

I divided the setup in three parts for logical reasons:

1) Set up the PC with things such as the latest version of PowerShell
   and Windows Terminal and Git for Windows.
2) Set up a command line environment for Azure scripting, development, 
   and Infrastrucutre as Code (IaC), and Visual Studio Code.
3) Set up tools supporting work with scripting and development 
   with things such as Azure Storage Explorer, Azure Data Studio, etc.

Note: Because installing is a bit of a chicken and egg problem,
I install my stuff in a specific order that makes sense chronologically.
Basically this means Git and VS Code are installed very early on.
Then my install continues from the command line in VS Code.

Prerequisites:
* I start my PC with a clean Windows 11 installation, updated to the latest of everyhing.
* Winget, the Windows Package Manager.
    * In case you don't have it automatically, I show below how to set it up manually.

Instructions for using my setup scripts:
* For each row in the file below, execute it on the command line!
    * That means put the cursor on the line and hit F8 (or whatever execution command is used in your case.)
    * Alternatively copy and paste the commands on your command line.
* As soon as PowerShell is updated, set it as default and always use it!
* A goal is to set you up wiht a very effective and powerful command line environment.
* I will try to call out where needed:
    * Sometimes a command must be executed as Admin. 
    * It happens that you need to restart your terminal session, log out and in again, or even reboot.
#>

# Ensure you can install remote modules.
Set-Executionpolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# --------------------------------------------------------------------------------------
# Winget is a command-line package manager for Windows 10.
explorer https://learn.microsoft.com/en-us/windows/package-manager/ # Read about it by executing this line!

# If the following command does not workm either you are on Windows 10 and can install winget, or you need to upgrade your OS!
winget

# To install winget go here and choose the "App Installer" from the Microsoft Store:
explorer https://apps.microsoft.com/store/search/App%20Installer

winget # verify winget is installed

# --------------------------------------------------------------------------------------
<# Windows Terminal
 # Windows Terminal is a new, modern, fast, efficient, powerful, and
 # productive terminal application for users of command-line tools and
 # shells like Command Prompt, PowerShell, and WSL.
#>
explorer https://docs.microsoft.com/en-us/windows/terminal/

# Do I already have Windows Terminal?
wt

# If not then install it!
winget install Microsoft.WindowsTerminal

wt # verify Windows Terminal is installed

# --------------------------------------------------------------------------------------
<# PowerShell 7
  # PowerShell 7 is a cross-platform (Windows, Linux, and macOS) automation
  # and configuration tool/framework that works well with your existing
  # tools and is optimized for dealing with structured data (e.g. JSON,
  # CSV, XML, etc.), REST APIs, and object models. It includes a command-line
  # shell, an associated scripting language and a framework for processing
  # cmdlets.

# You can execute this line below to read about installing PowerShell 7, even if it is in a comment!
explorer https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows
#>

winget install --id Microsoft.Powershell --source winget --override '/SILENT /mergetasks="addopenherecontextmenus,addrunwithpowershell7contextmenu"'

# Note: the overrides '/SILENT /mergetasks="addopenherecontextmenus,addrunwithpowershell7contextmenu"'
#       are convenient to add the "Open PowerShell 7 here" and "Run with PowerShell 7" context menu items.

exit # restart your terminal

wt # start Windows Terminal

$PSVersionTable # Check your PS version. This can be 5.1 or similar.

pwsh # Start PowerShell 7 in your terminal session.

$PSVersionTable # Now your PS version should be 7.3.0 or higher.

# --------------------------------------------------------------------------------------
<# wt configuration - choose "arrow" and "settings", or type ctrl+,!:
* Default profile: 'PowerShell' (which means Power Shell 7, instead of Windows Powershell, the old version).
* Default terminal application: Windows Terminal
* Launch mode: I prefer maximized.
* Save settings! (I often forget this step.)

# --------------------------------------------------------------------------------------
<# Git
 # Git is a free and open source distributed version control system
 # designed to handle everything from small to very large projects
 # with speed and efficiency.
explorer https://git-scm.com/
#>
git --version # check if git is installed

winget install Git.Git # install git

git --version # verify git is installed

# Configure your git user email and name:
git config --global user.email "you@example.com" # replace with your email
git config --global user.name "Your Name" # replace with your name

<# Alternatively, install Git manually:
explorer https://git-scm.com/download/win
# Download and install git.
#>

# --------------------------------------------------------------------------------------
# Set up a location for where you develop code
$codeDir = 'c:\code'
New-Item -ItemType Directory -Path $codeDir
Set-Location $codeDir

# Create a profile file for custom settings.
notepad $profile
# Insert this in the file and save - your command line will always start in this location:
Set-Location $codeDir
# Reload your profile.
. $profile

# There is probably multiple profile files on your computer:
$profile | Format-List -Force
# Check to see what profile file you use now:
$profile

# ------------------------------------------------------------------
<# Visual Studio Code
 # Visual Studio Code is a code editor redefined and optimized for
 # building and debugging modern web and cloud applications.

explorer https://code.visualstudio.com/

# Do I already have Visual Studio Code?
code # Start Visual Studio Code

# Note: This is the chicken and egg situation I mentioned above.
# Code does not need to go in this early, but it makes sense in context.
#>
winget install Microsoft.VisualStudioCode --source winget --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'

<# VS Code installation options:

# 1) Install VS Code manually from the site just above:
explorer https://code.visualstudio.com/

# 2) VS Code download from the command line and launch the install:
New-Item -ItemType Directory -Path 'c:\temp'
Invoke-WebRequest -Uri 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user' -OutFile 'c:\temp\vscode.exe'
c:\temp\vscode.exe # Run this!
#>

code # verify VS Code is installed

# ------------------------------------------------------------------
<# Add som Visual Studio Code Extensions
 # Note: I use the command line to install extensions, but you can also
 #       install them from the Extensions tab in Visual Studio Code.
 # You can also read about the extensions I use here:
explorer https://marketplace.visualstudio.com/VSCode
#>
code --install-extension AzurePolicy.azurepolicyextension
code --install-extension ms-azuretools.vscode-azureresourcegroups
code --install-extension ms-azuretools.vscode-azurestorage
code --install-extension ms-azuretools.vscode-azurevirtualmachines
code --install-extension ms-azuretools.vscode-bicep
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-dotnettools.vscode-dotnet-runtime
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-vscode-remote.remote-ssh-explorer
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vscode.azure-account
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.vscode-node-azure-pack
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ms-vsonline.vsonline
code --install-extension msazurermtools.azurerm-vscode-tools

# ------------------------------------------------------------------
<# Change an incorrect default in VS Code.

The biggest problem with VS Code is that it has a "wrong" default setting.

When you execute code from a script file in VS Code
the default behaviour is to focus on the command prompt.

This is quite annoying when you want to use F8 to execute a partial script.

If you have your cursor on a given line and hit F8 VS Code
PowerShell extension will execute that line.

In VS Code, try below by putting your cursor on the following line and hitting the F8 button:
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

<# Configure WT to use the new font! in the VS Code settings file:
"terminal.integrated.fontFamily": "CaskaydiaCove NF",
"terminal.integrated.fontSize": 14
#>

# --------------------------------------------------------------------------------------
<# Ensure Windows Terminal (wt) and Visual Studio Code Teminal use the exact same PowerShell 7 profile.
 # This is a convenience to ensure that you have the same settings in both terminals.
 # The following two files fetched by the $profile command should be the same:
#>
wt # Start Windows Terminal
$profile # run in the command line in Windows Terminal.
code # Start Visual Studio Code
$profile # run on the pwsh command line in VS Code.
# Are the two terminal instances using the same profile?

# --------------------------------------------------------------------------------------
<# Now that you have git on your system, you can clone my repo with all
   setup scripts, including this one!
#>
$codeDir = 'c:\code'
New-Item -ItemType Directory -Path $codeDir
Set-Location $codeDir
$repoName = 'I.CMD.you.to.develop.fast.in.Azure'
git clone "https://github.com/noopman/$repoName.git"
Set-Location "$codeDir\$repoName"
code .


code -n . # Open the folder in VS Code.
code -r -g .\Noopman.Setup01.PC.ps1:260 # Open the file and go to line 260.

# Let's continue here! ;~)

# Note: now you are in VS Code and you can execute 

# --------------------------------------------------------------------------------------
<# PSReadLine
 # PSReadLine is a module that provides command line editing features in the PowerShell console host.
explorer https://learn.microsoft.com/en-us/powershell/module/psreadline/
#>
Install-Module PSReadLine -Force -SkipPublisherCheck -AllowPrerelease
# Check the install:
Get-Module | Where-Object { $_.Name -EQ 'PSReadLine' } | Format-Table Name, Version
# This is the folder where console history will be stored that is used by PSReadLine:
explorer "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine"

# --------------------------------------------------------------------------------------
# CaskaydiaCove NF or Cascadia Code PL fonts.
# These are good looking fonts we will use on the command line.

# See releases:
explorer https://github.com/ryanoasis/nerd-fonts/releases/
# Get this:
explorer https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/CascadiaCode.zip
# Download and extract zip.
# Install the fonts on the computer.

# See releases:
explorer https://github.com/microsoft/cascadia-code/releases #PL = Power Line
# Get this:
explorer https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip
# Download and extract zip.
# Install the fonts in the ttf folder on the computer (I don't install all fonts in the "static" folder).

# --------------------------------------------------------------------------------------
# Configure WT to use the new font: Two options! 
<# Option 1: Graphically

* Go to: WT > Settings > Profiles > Default > Font
* Set CaskaydiaCove NF as the font face.
* Set 14 as the font size. I prefer a slightly larger font. You choose one that suits you!
* Save settings!
#>
<# Option 2, using the config file, which I prefer:

* Open WT settings and in the bottom left select "Open JSON file".
* Add the font to the default profile and select a font size you like.
"profiles": {
        "defaults": {
            // Put settings here that you want to apply to all profiles.
            "font":{
                "face": "CaskaydiaCove NF",
                "size": 14
            }
        },
* Save the config file.
#>

# --------------------------------------------------------------------------------------
<# Terminal icons
 # Terminal-Icons is a PowerShell module that adds file and folder icons
 # when displaying items in the terminal.
 # This relies on the custom fonts provided by Nerd Fonts.
explorer https://github.com/devblackops/Terminal-Icons
#>
Install-Module -Name Terminal-Icons -AllowClobber -Force
notepad $profile # Open your profile file.
# Insert the next line in your profile and save:
Import-Module -Name Terminal-Icons
. $profile # Reload your profile in the current session.
Get-ChildItem # Check that the icons are working.

# --------------------------------------------------------------------------------------
<# Install oh-my-posh
 # oh-my-posh is a theme engine for your shell. It allows you to use
 # themes created by the community or create your own.
 # This relies on the custom fonts provided by Nerd Fonts.
explorer https://ohmyposh.dev/docs/installation/windows
#>
# Either
winget install JanDeDobbeleer.OhMyPosh --source winget
<# Or download and install manually.
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
#>

# Restart terminal

# Where is it oh-my-posh installed?
(Get-Command oh-my-posh).Source

# What shell am I running?
oh-my-posh get shell # should be 'pwsh' for PowerShell 7.

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