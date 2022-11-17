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
# 1) Git (Installed in Noopman.Tools.Setup.ps1)
# 2) GitHub CLI
# 3) Azure CLI (installed above)
#>














# Install git:
explorer https://git-scm.com/

git













# Install GutHub cli:
explorer https://github.com/cli/cli

winget install --id GitHub.cli

gh












# Install azd

# Azure Developer Cli (preview)

powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

















# Get started with azd
explorer https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/get-started

azd

















$path = 'c:\code\azd.test'
New-Item -ItemType Directory $path
Set-Location $path










azd template list

explorer https://github.com/orgs/Azure-Samples/repositories

















azd up --template todo-csharp-cosmos-sql





















explorer https://github.com/Azure-Samples/todo-csharp-cosmos-sql



















azd down













return

New-Item -itemtype directory -path .\azddemo
Set-Location .\azddemo

# Sample that also requires node
explorer https://nodejs.org/en/
azd up --template todo-nodejs-mongo

azd down # Takes your infrastructure down from Azure.

explorer https://github.com/Azure-Samples/todo-csharp-cosmos-sql
azd up --template todo-csharp-cosmos-sql

azd down # Takes your infrastructure down from Azure.
