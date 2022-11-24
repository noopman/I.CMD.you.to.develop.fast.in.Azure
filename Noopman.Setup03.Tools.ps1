<#
There are many Azure and development related tools.

Here is a set of the ones I use occasionally, or every day. Please enjoy!

The intent is that you execute one line at a time in this script file.
While this is installing you will get a fast way to run each line using F8.
For starters type the command or copy paste each one.
#>

# --------------------------------------------------------------------------------------
<# I use one specific cmdlet from PowerShellCookbook called Show-Object.
 It shows a json-object graphically.
#>
Install-Module -Name PowerShellCookbook -AllowClobber -Force
Import-Module -Name PowerShellCookbook

$someObject = Get-Item .

# First to show what is not very useful.
$someObject # This outputs the object to the console with the default representation.

# Now to show what Show-Object does.
Show-Object $someObject # This will show the object in a nice way which you can browse:

# --------------------------------------------------------------------------------------
<# Microsoft Azure Storage Explorer
 # Standalone app that makes it easy to work with Azure Storage
 # data on Windows, macOS, and Linux.
explorer https://learn.microsoft.com/en-us/azure/vs-azure-tools-storage-manage-with-storage-explorer
#>
winget install Microsoft.AzureStorageExplorer

# --------------------------------------------------------------------------------------
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

# --------------------------------------------------------------------------------------
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

# ----------------------------------------------------------------------------------
# Some more optional tools based on your needs.
# Each install is commented out but you can run each line with F8!

# ----------------------------------------------------------------------------------
<# Azure Functions Core Tools
 # A command-line interface
 # that you can use to develop and test Azure Functions locally.
explorer https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local
#>
winget install Microsoft.AzureFunctionsCoreTools

# ----------------------------------------------------------------------------------
<# Azure Data Studio
 # Cross-platform database tool
 # for data professionals working with the Microsoft family of on-premises
 # and cloud-based data platforms.
explorer https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio
# optional install in case you need it
#>
winget install Microsoft.AzureDataStudio

# ----------------------------------------------------------------------------------
<# Azure Cosmos DB Emulator
 # A local version of Azure Cosmos DB
explorer https://learn.microsoft.com/en-us/azure/cosmos-db/local-emulator
# optional install in case you need it
#>
winget install Microsoft.AzureCosmosEmulator

# ----------------------------------------------------------------------------------
<# Microsoft Azure IoT Explorer
 # A cross-platform tool that enables you to
 # interact with your IoT Hub and devices.
explorer https://learn.microsoft.com/en-us/azure/iot-fundamentals/howto-use-iot-explorer
# optional install in case you need it
#>
winget install Microsoft.azure-iot-explorer

###END####################
return

# The repo where you can get this script is here:
explorer https://github.com/noopman/I.CMD.you.to.develop.fast.in.Azure

# Please enjoy, reuse, and share! ; ~) Give credit to @noopman!

# Thanks for reaching this far. I hope this is useful to you! /noopman