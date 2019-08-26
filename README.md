# qsharp.sty #

Copyright (C) 2018 by Microsoft.
Maintained by Chris Granade (chgranad@microsoft.com).

This package provides LaTeX syntax highlighting for Q#.

## Installing ##

### Install With PowerShell ###

In an attempt to cut down on the pain of LaTeX package installation, ``{qsharp}`` uses [PoShTeX](https://github.com/cgranade/posh-tex/) to automate installation.
If you're running PowerShell already, just run ``Install.ps1``:

```powershell
PS> Unblock-File Install.ps1 # Mark the installer as safe to run.
PS> ./Install.ps1
```

PowerShell itself is easy to install on many macOS and Linux systems using the [provided packages](https://github.com/PowerShell/PowerShell#get-powershell).
