<#
Install a bunch of Azure and development related tools!

(Not az cli, that's a separate script. -> noopman.cmd.setup.ps1)
#>

<# Windows Terminal
 # Windows Terminal is a new, modern, fast, efficient, powerful, and
 # productive terminal application for users of command-line tools and
 # shells like Command Prompt, PowerShell, and WSL.
explorer https://docs.microsoft.com/en-us/windows/terminal/
# Do I already have Windows Terminal?
wt # Start Windows Terminal
# If not then install it!
#>
winget install Microsoft.WindowsTerminal

<# PowerShell 7
  # PowerShell 7 is a cross-platform (Windows, Linux, and macOS) automation
  # and configuration tool/framework that works well with your existing
  # tools and is optimized for dealing with structured data (e.g. JSON,
  # CSV, XML, etc.), REST APIs, and object models. It includes a command-line
  # shell, an associated scripting language and a framework for processing
  # cmdlets.
explorer https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows
#>
winget install Microsoft.PowerShell
pwsh.exe # Start PowerShell 7

<# Git
 # Git is a free and open source distributed version control system
 # designed to handle everything from small to very large projects
 # with speed and efficiency.
explorer https://git-scm.com/
#>
winget install Git.Git

<# GitHub CLI
 # GitHub CLI is a command line tool for GitHub.
 # It brings pull requests, issues, and other GitHub concepts to the
 # terminal next to where you are already working with git and your
 # code.
explorer https://cli.github.com/
#>
winget install GitHub.cli
gh --version # Check it's installed

<# Node Package Manager (npm)
 # npm is the package manager for JavaScript and the world’s largest
 # software registry. Discover packages of reusable code — and assemble
 # them in powerful new ways.
explorer https://www.npmjs.com/
#>

# ------------------------------------------------------------------

<# Installing npm (Node Package Manager)

# Sorry, but this is very roundabout. I'm not sure why it's so hard?

We want to have NPM installed.

1) Install cocolatey - to install nodist
2) Install nodist - to install node
3) Install node - to install npm

# Fortunately, installing nodist also installs node and npm!

#>

# Install chocolatey - using the community ps1 script
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install nodist - using chocolatey
# explorer https://github.com/nullivex/nodist
choco install nodist --confirm

# Please note, logging out and in again is required for nodist to work.
nodist -v # The version of nodist

$latestNodeVersion = (nodist dist)[-1].Trim() # The latest version of node
nodist global $latestNodeVersion # Set the latest version of node as the global version
nodist # List the installed versions of node
node -v
npm -v
nodist npm match
node -v
npm -v


# In case you want to download and install node.js manually and not use
# nodist (or chocolatey), then you can get the latest version from here:
# https://nodejs.org/en/download/

node -v # The version of node installed
npm -v # The version of npm installed

# ------------------------------------------------------------------

<# Visual Studio Code
 # Visual Studio Code is a code editor redefined and optimized for
 # building and debugging modern web and cloud applications.
explorer https://code.visualstudio.com/
# Do I already have Visual Studio Code?
code # Start Visual Studio Code
#>
winget install Microsoft.VisualStudioCode
# Visual Studio Code -> Extensions
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

<# Microsoft Azure Storage Explorer
 # Standalone app that makes it easy to work with Azure Storage
 # data on Windows, macOS, and Linux.
explorer https://learn.microsoft.com/en-us/azure/vs-azure-tools-storage-manage-with-storage-explorer
#>
winget install Microsoft.AzureStorageExplorer

<# Microsoft Bicep
 # Bicep is a declarative language for deploying resources to Azure.
 # It aims to drastically simplify the authoring experience with a
 # cleaner syntax, improved type safety, and better support for
 # modularity and code re-use.
 # In a Bicep file, you define the infrastructure you want to deploy to Azure,
 # and then use that file throughout the development lifecycle 
 # to repeatedly deploy your infrastructure.
 # Your resources are deployed in a consistent manner.
 # Bicep provides concise syntax, reliable type safety, 
 # and support for code reuse.
 # Bicep offers a first-class authoring experience for your
 #  infrastructure-as-code (IaC) solutions in Azure.
explorer https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview
#>
winget install Microsoft.Bicep

<# AzCopy
 # AzCopy is a command-line utility designed for copying data to/from
 # Microsoft Azure Blob and File storage, using simple commands or
 # scripts.
explorer https://learn.microsoft.com/en-us/azure/storage/common/storage-ref-azcopy
# Get started with AzCopy
explorer https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10
#>
# AzCopy v10 (Windows 64-bit zip)
# Installation not available on winget. Download and install.
Invoke-WebRequest -Uri 'https://aka.ms/downloadazcopy-v10-windows' -OutFile AzCopy.zip -UseBasicParsing
Expand-Archive ./AzCopy.zip ./AzCopy -Force
$azcopyDir = 'C:\Program Files\AzCopy'
New-Item -ItemType Directory $azcopyDir # This requires admin privileges
Get-ChildItem ./AzCopy/*/azcopy.exe | Move-Item -Destination "$azcopyDir\."
$userenv = [System.Environment]::GetEnvironmentVariable('Path', 'User')
# Requires sign-out and sign-in to take effect.
[System.Environment]::SetEnvironmentVariable('PATH', $userenv + ";$azcopyDir", "User")
Remove-Item ./AzCopy.zip
Remove-Item ./AzCopy -Recurse
AzCopy # Verify installation

<# Azure PowerShell Az
 # Az is the PowerShell module for Microsoft Azure.
 # It provides cmdlets for managing resources in Azure.
explorer https://learn.microsoft.com/en-us/powershell/azure/what-is-azure-powershell
#>
Install-Module -Name Az -Scope AllUsers -Repository PSGallery -Force

# ----------------------------------------------------------------------------------
# Some more optional tools based on your needs.
# Each install is commented out but you can run each line with F8!

<# Azure Functions Core Tools
 # A command-line interface
 # that you can use to develop and test Azure Functions locally.
explorer https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local
winget install Microsoft.AzureFunctionsCoreTools
#>

<# Azure Data Studio
 # Cross-platform database tool
 # for data professionals working with the Microsoft family of on-premises
 # and cloud-based data platforms.
explorer https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio
# optional install in case you need it
winget install Microsoft.AzureDataStudio
#>

<# Azure Cosmos DB Emulator
 # A local version of Azure Cosmos DB
explorer https://learn.microsoft.com/en-us/azure/cosmos-db/local-emulator
# optional install in case you need it
winget install Microsoft.AzureCosmosEmulator
#>

<# Microsoft Azure IoT Explorer
 # A cross-platform tool that enables you to
 # interact with your IoT Hub and devices.
explorer https://learn.microsoft.com/en-us/azure/iot-fundamentals/howto-use-iot-explorer
# optional install in case you need it
winget install Microsoft.azure-iot-explorer
#>
