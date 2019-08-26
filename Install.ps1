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

Install-TeXUserResource tex/latex/qsharp qsharp.sty, qsharp.pdf

if ($CTAN) {
    Export-CTANArchive -ArchiveLayout Simple qsharp.ins, qsharp.pdf, README.md, Install.ps1
}
