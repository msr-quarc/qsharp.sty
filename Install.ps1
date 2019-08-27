# Copyright (C) 2018 by Microsoft.
# ---------------------------------------------------------------------------
# This work may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.3
# of this license or (at your option) any later version.
# The latest version of this license is in
#   http://www.latex-project.org/lppl.txt
# and version 1.3 or later is part of all distributions of LaTeX
# version 2005/12/01 or later.
#
# This work has the LPPL maintenance status `maintained'.
#
# The Current Maintainer of this work is Christopher Granade (chgranad@microsoft.com).
#
# This work consists of the files qsharp.dtx and qsharp.ins,
# the derived filebase qsharp.sty, and the associated installer file Install.ps1.

param(
    [switch] $CTAN
)

#region Bootstrap PoShTeX
    $modules = Get-Module -ListAvailable -Name posh-tex;
    if (!$modules) {Install-Module posh-tex -Scope CurrentUser}
    if (!($modules | ? {$_.Version -ge "0.1.7.4"})) {Update-Module posh-tex}
    Import-Module posh-tex -Version "0.1.7.4"
#endregion

Out-TeXStyle qsharp
Out-TeXStyleDocumentation qsharp
# Note that we need to also run makeindex and rerun the documentation generation.
# TODO: contribute this back to posh-tex.
makeindex -s gglow.ins -o qsharp.gls qsharp.glo
Out-TeXStyleDocumentation qsharp

# Record the changelog and regenerate.
makeindex -s gglo.ist -o qsharp.gls qsharp.glo
Out-TeXStyleDocumentation qsharp

Install-TeXUserResource tex/latex/qsharp qsharp.sty, qsharp.pdf

if ($CTAN) {
    Export-CTANArchive -ArchiveLayout Simple qsharp.ins, qsharp.pdf, README.md, Install.ps1, LICENSE
}
