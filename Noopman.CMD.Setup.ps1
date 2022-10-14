


# az # command line interface
explorer https://learn.microsoft.com/en-us/cli/azure/

explorer https://learn.microsoft.com/en-us/cli/azure/install-azure-cli

# In case you can and want to use the Microsoft Package Manager for Windows
winget install -e --id Microsoft.AzureCLI





























# I <3 PowerShell! But this session is not about that.
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
















az




















# azd

explorer https://devblogs.microsoft.com/azure-sdk/azure-developer-cli-azd-october-2022-release/

# To Install review this (steps below):
explorer https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd












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
