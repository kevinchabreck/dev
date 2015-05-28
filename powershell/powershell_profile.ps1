
# update path
$env:path += ";C:\Users\kchabreck\dev\scripts"

# import modules
Import-Module PsGet
Import-Module posh-git
Import-Module VirtualEnvWrapper
Import-Module PSReadLine

# Load posh-git profile
. "~\dev\poshgit_profile.ps1"

# PSReadLine options
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete # bash-style autocompletion
Set-PSReadlineKeyHandler -Key Ctrl+k -Function KillLine
Set-PSReadlineKeyHandler -Key Alt+LeftArrow -Function BeginningOfLine

# command aliases
Set-Alias s sublime_text
Set-Alias p python

# stupid workaround for multi-command aliases
# git commands
Function git-status {git status}
Set-Alias gs git-status
Function git-add {git add $args}
Set-Alias ga git-add
Function git-branch {git branch $args}
Set-Alias gb git-branch
Function git-branchall {git branch -a $args}
Set-Alias gba git-branchall
# python unit testing command
Function unit-test {python -m unittest discover}
Set-Alias ptest unit-test

###########################
# filesize string formatter
###########################
Function Format-DiskSize() {
    [cmdletbinding()]
    Param ([long]$Type)
    If ($Type -ge 1TB) {[string]::Format("{0:0.00} TB", $Type / 1TB)}
    ElseIf ($Type -ge 1GB) {[string]::Format("{0:0.00} GB", $Type / 1GB)}
    ElseIf ($Type -ge 1MB) {[string]::Format("{0:0.00} MB", $Type / 1MB)}
    ElseIf ($Type -ge 1KB) {[string]::Format("{0:0.00} KB", $Type / 1KB)}
    ElseIf ($Type -gt 0) {[string]::Format("{0:0.00} B", $Type)}
    Else {""}
}

###############################
# color output for 'ls' command
###############################
function Write-Color-LS {
    param ([string]$color = "Gray", $file)
    Write-host ("{0,-7} {1,9} {2,10}  " -f $file.mode, (Format-DiskSize $file.length), ([String]::Format("{0,10}  {1,8}", $file.LastWriteTime.ToString("d"), $file.LastWriteTime.ToString("t")))) -noNewLine
    Write-host "$file" -foregroundcolor $color 
}
New-CommandWrapper Out-Default -Process {
    $regex_opts = ([System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

    # define 'compressed' filetypes 
    $compressed = New-Object System.Text.RegularExpressions.Regex(
        '\.(zip|tar|gz|rar|jar|war)$', $regex_opts)

    # define executable filetypes
    $executable = New-Object System.Text.RegularExpressions.Regex(
        '\.(exe|bat|cmd|pl|ps1|psm1|vbs|rb|reg)$', $regex_opts)
    
    # define text filetypes
    $text_files = New-Object System.Text.RegularExpressions.Regex(
        '\.(txt|cfg|conf|ini|csv|log|xml|java|c|cpp|cs|py)$', $regex_opts)

    if(($_ -is [System.IO.DirectoryInfo]) -or ($_ -is [System.IO.FileInfo])) {
        if(-not ($notfirst)) {
           Write-Host
           $notfirst=$true
        }

        if ($_ -is [System.IO.DirectoryInfo]) {
            Write-Color-LS "Cyan" $_                
        }
        elseif ($compressed.IsMatch($_.Name)) {
            Write-Color-LS "Red" $_
        }
        elseif ($executable.IsMatch($_.Name)) {
            Write-Color-LS "Green" $_
        }
        elseif ($text_files.IsMatch($_.Name)) { 
            Write-Color-LS "Gray" $_ 
        }
        else { 
            Write-Color-LS "Gray" $_ 
        }

    $_ = $null
    }
} -end {
    write-host ""
}