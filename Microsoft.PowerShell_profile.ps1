function prompt { 
    [string]$ANGLES = "❯" * (1 + $NestedPromptLevel)
    [string]$CWD = Get-Location
    
    $host.ui.rawui.WindowTitle = $CWD
    
    Write-Host "`n$CWD" -ForegroundColor Green
    Write-Host $ANGLES -NoNewline -ForegroundColor Red
    
    return " "
}

if ($host.Name -eq 'ConsoleHost')
{
    ## https://github.com/dahlbyk/posh-git
    Import-Module posh-git

    ## https://github.com/PowerShell/PSReadLine
    Import-Module PSReadLine

    ## import this after PSReadLine since this sets up readline integrations
    ## https://github.com/kelleyma49/PSFzf
    Import-Module PSFzf
    # replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
    Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
    Set-PsFzfOption -TabExpansion

    ## https://github.com/lzybkr/TabExpansionPlusPlus
    ## Import-Module TabExpansionPlusPlus

    ## https://github.com/vors/ZLocation
    Import-Module ZLocation

    ## https://github.com/vors/PSUtil
    ##Import-Module PSUtil
}