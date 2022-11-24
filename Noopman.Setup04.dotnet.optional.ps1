<#
Here is a script more rough around the edges that installs donet and asp.net core.

I'm sure it is full of errors and way less pedagogical than the other ones,
but it works somewhat as is!

Note: Here be dragons! Use at your own risk! /noopman
#>

#-----------------------------------------------
# .NET CLI

https://learn.microsoft.com/en-us/dotnet/core/tools/

https://github.com/dotnet/docs/blob/main/docs/core/tools/index.md

https://github.com/dotnet/docs/tree/main/docs/core/tutorials there are three 

# Is it installed?
dotnet --list-sdks
dotnet --list-runtimes
# When the SDK IS NOT installed, but VS Code is installed:
explorer .\images\dotnet.sdk.not.installed.png

## Install .NET and ASP.NET

winget install Microsoft.DotNet.SDK.7

winget install Microsoft.DotNet.DesktopRuntime.7

winget install Microsoft.DotNet.AspNetCore.7

winget install Microsoft.DotNet.Runtime.7

# => https://dotnetcli.azureedge.net/dotnet/Sdk/6.0.401/dotnet-sdk-6.0.401-win-x64.exe
# alternatives
explorer https://dotnet.microsoft.com/en-us/download/dotnet/6.0

# Is it installed?
dotnet --list-sdksj
dotnet --list-runtimes

# When the SDK IS installed, but VS Code is installed:
explorer .\images\dotnet.sdk.installed.png

# To only install ASP.NET core alone:
explorer https://dotnet.microsoft.com/en-us/download/dotnet/7.0

# For VS Code.
explorer https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp

code --install-extension ms-dotnettools.csharp

# Use it C# and .NET in VS Code.
explorer https://learn.microsoft.com/en-us/dotnet/core/tutorials/with-visual-studio-code

if (!(Test-Path .\demos)) {New-Item -ItemType Directory .\demos}
Set-Location .\demos
dotnet new console --framework net7.0
dotnet run

<#
----------------
Installed an ASP.NET Core HTTPS development certificate.
To trust the certificate run 'dotnet dev-certs https --trust' (Windows and macOS only).
Learn about HTTPS: https://aka.ms/dotnet-https
#>

explorer https://dotnet.microsoft.com/en-us/learn/dotnet/hello-world-tutorial/intro

#-----------------------------------------------
# .NET CLI With Container Support

#--- This is the docker first tutorial in docker desktop
docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
Set-Location getting-started
docker build -t docker101tutorial .
docker run -d -p 80:80 \ --name docker-tutorial docker101tutorial
docker tag docker101tutorial /docker101tutorial
docker push /docker101tutorial
#---

# create a new project and move to its directory
dotnet new mvc -n my-awesome-container-app
Set-Location my-awesome-container-app

# add a reference to a (temporary) package that creates the container
dotnet add package Microsoft.NET.Build.Containers

# publish your project for linux-x64
dotnet publish --os linux --arch x64 -p:PublishProfile=DefaultContainer

# run your app using the new container
docker run -it --rm -p 5010:80 my-awesome-container-app:1.0.0
