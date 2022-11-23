<#
Install the Azure Command-Line Interface (CLI), or 'az'
and the Azure Developer CLI, or 'azd'.

This will set up your Azure command line environment
and enable you to use the Azure CLI and Azure Developer CLI.

Note: I love and use both the Azure CLI and the Azure PowerShell modules.
Nobody cares with one is "better", because both work great.
#>

# --------------------------------------------------------------------------------------
<# Azure CLI
 # The Azure CLI is a set of commands used to create and manage Azure
 # resources. The Azure CLI is available across Azure services and is
 # designed to get you working quickly with Azure, with an emphasis on
 # automation.
explorer https://learn.microsoft.com/en-us/cli/azure/what-is-azure-cli
# How to manually install az
explorer https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
#>
winget install --exact --id Microsoft.AzureCLI



















az # verify az is installed
az version



















# --------------------------------------------------------------------------------------
<# Azure Developer CLI
 # The Azure Developer CLI is a set of commands used to create and
 # manage Azure resources. The Azure Developer CLI is available across
 # Azure services and is designed to get you working quickly with Azure,
 # with an emphasis on automation.

# Announcement blog post (preview)
explorer https://devblogs.microsoft.com/azure-sdk/azure-developer-cli-azd-october-2022-release/
# To Install review this (steps below):
explorer https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd

# Three (3) Requirements for azd

# Installed above:
# 1) Azure CLI

# Installed in https://raw.githubusercontent.com/noopman/I.CMD.you.to.develop.fast.in.Azure/main/Noopman.Tools.Setup.ps1
# 2) Git
# 3) GitHub CLI
# 4) Npm

# Review the following repo for all instructions:
explorer https://github.com/noopman/I.CMD.you.to.develop.fast.in.Azure/
#>

# --------------------------------------------------------------------------------------
<# GitHub CLI
 # GitHub CLI is a command line tool for GitHub.
 # It brings pull requests, issues, and other GitHub concepts to the
 # terminal next to where you are already working with git and your
 # code.
explorer https://cli.github.com/
#>
winget install GitHub.cli
gh --version # Check it's installed

# --------------------------------------------------------------------------------------
<# Node Package Manager (npm)
 # npm is the package manager for JavaScript and the world’s largest
 # software registry. Discover packages of reusable code — and assemble
 # them in powerful new ways.
explorer https://www.npmjs.com/
#>
<# Installing npm (Node Package Manager)

Sorry, but this is very roundabout. I'm not sure why it's so hard?

We want to have NPM installed.

1) Install cocolatey - to install nodist
2) Install nodist - to install node
3) Install node - to install npm

Fortunately, installing nodist also installs node and npm!
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

# --------------------------------------------------------------------------------------
<# There! Strange prerequisites, but now we have npm installed.

Verify that all these commans work:
#>
git -v
gh --version
node -v # The must be 16.0.0. or higher to work with azd
npm -v

# If all above are installed - the commands run - then you're good to go with azd (preview)!











# --------------------------------------------------------------------------------------
<# Install azd
# Azure Developer Cli (preview)
#>
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# * Note: Yes, the preview downloads a powershell script and runs it.

azd # verify azd is installed
azd version

# Read how to get started with azd
explorer https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/get-started



































# Create a place to work.
$path = 'c:\code\azd.test'
Remove-Item -Force -Recurse $path -ea 0
New-Item -ItemType Directory $path
Set-Location $path
(Get-Location).Path
















# The available preview templates are:
azd template list
# The template list is sourced from the Azure Samples GitHub repo
explorer https://github.com/orgs/Azure-Samples/repositories
















# An exaple template to try:
explorer https://github.com/Azure-Samples/todo-csharp-cosmos-sql

# Deploy this template to azure - ONE LINE
# This is the *MAGIC*!

azd up --template todo-csharp-cosmos-sql







































# Remove the resources created by azd up - ONE LINE
azd down



















# Some more examples of azd templates if you like.

New-Item -itemtype directory -path .\azddemo
Set-Location .\azddemo

# Sample that also requires node
explorer https://nodejs.org/en/
azd up --template todo-nodejs-mongo

azd down # Takes your infrastructure down from Azure.

explorer https://github.com/Azure-Samples/todo-csharp-cosmos-sql
azd up --template todo-csharp-cosmos-sql

azd down # Takes your infrastructure down from Azure.








# Now continue with the next and final step: tools supporting development and scripting
code -r -g .\Noopman.Setup03.Tools.ps1:1

###END####################
return

# The repo where you can get this script is here:
explorer https://github.com/noopman/I.CMD.you.to.develop.fast.in.Azure

# Please enjoy, reuse, and share! ; ~) Give credit to @noopman!

# Thanks for reaching this far. I hope this is useful to you! /noopman