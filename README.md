# I CMD you to develop fast in Azure

This is the [@noopman](https://twitter.com/noopman) coding and scripting PC-setup for Azure. Enjoy, reuse, share!

# Introduction

I divided the setup in three parts for logical reasons:

1) [PC Setup](./Noopman.Setup01.PC.ps1) with the latest version of PowerShell, Windows Terminal and Git for Windows, etc.
2) [Command line environment](./Noopman.Setup02.CMD.ps1) for Azure scripting, development, and Infrastrucutre as Code (IaC).
3) [Tools](./Noopman.Setup03.Tools.ps1) supporting work with scripting and development, such as Azure Storage Explorer, Azure Data Studio, etc.

---

4) [dotnet](./Noopman.Setup04.dotnet.(optional).ps1) I am including this rough draft of a donet and asp.net setup. It is not at as finished as the three steps for Azure yet.

*Note: Because installing is a bit of a chicken and egg problem, I install my stuff in a my own specific order that makes sense chronologically. Basically this means Git and VS Code are installed very early on, when in truth they could have been installed last! One reason is that I execute my install normally from inside VS Code, so I install that "first".*

## Prerequisites

* Your PC should have a clean Windows installation, updated to the latest of everyhing. 
  * Ideally Windows 11, but I recognize that a lot of people are using Windows 10.
  * In case you are on an even older OS version, I'm sorry, try to use what you can from this repo, but your value will be way less. And you also badly need an OS upgrade!
* Winget, the Windows Package Manager.
  * In case you don't have it automatically, I show how to set it up manually.
  * If your system does not support winget, I try to help out a bit with the manual installation options, but again, you badly need an OS upgrade!

## Instructions for using my setup scripts

* For each row in the script files, execute it on the command line!
  * That means put the cursor on the line and hit F8 (or whatever execution command is used in your case.)
  * Alternatively copy and paste the commands on your command line and execute them in turn!
* As soon as PowerShell is updated, set it as system default, and always use that!
* A goal is to set you up a very effective and powerful command line environment! Follow this guida and you will get that!
* I try to call out where needed:
  * Sometimes a command must be executed as Admin. 
  * It happens that you need to restart your terminal session, log out and in again, or even reboot.

*Note: If you have suggestions or additions, please submit a comment or a PR!*

*Call to action: If I make a change to my setup based on your suggestion, I will add your name as credit here below!*

## Thanks to a bunch of people for the inspiration

Including but not limted to:

* Scott Hanselman: His inspirational blog post: [My Ultimate PowerShell prompt with Oh My Posh and the Windows Terminal](https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal)
* Thomas Maure: His inspirational blog post: [Install Azure tools using winget](https://www.thomasmaurer.ch/2021/08/install-azure-tools-using-winget/)

Happy coding and scrpting in the Azure Cloud!

Cheers,

/Magnus ;~)