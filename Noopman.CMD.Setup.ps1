<#
Install the Azure Command-Line Interface (CLI), or 'az'
And the Azure Developer CLI, or 'azd'
#>

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


# Verify that all these are installed
git -v
gh --version
node -v # The must be 16.0.0. or higher to work with azd
npm -v
# If all above are installed - the commands run - then you're good to go!











# Install azd
# Azure Developer Cli (preview)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"





















# Get started with azd
explorer https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/get-started

azd # verify azd is installed
azd version
















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













return

# Some more examples of azd templates

New-Item -itemtype directory -path .\azddemo
Set-Location .\azddemo

# Sample that also requires node
explorer https://nodejs.org/en/
azd up --template todo-nodejs-mongo

azd down # Takes your infrastructure down from Azure.

explorer https://github.com/Azure-Samples/todo-csharp-cosmos-sql
azd up --template todo-csharp-cosmos-sql

azd down # Takes your infrastructure down from Azure.
