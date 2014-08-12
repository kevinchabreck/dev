Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# set up prompt
function global:prompt {
    # save exit code
    $realLASTEXITCODE = $LASTEXITCODE

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

    # print working directory
    $ppath = $pwd.ProviderPath
    Write-Host -ForegroundColor Green "($ppath)" -nonewline

    # calculate remaining line length
    $pshost = get-host
    $width = $pshost.ui.rawui.buffersize.width
    $left = [Console]::CursorLeft
    $dif = $width - $left

    # print dividing line & username
    $username = $env:username
    $line = "-" * ($dif - (7 + $username.Length))
    write-host " $line" -nonewline
    write-host -ForegroundColor Green " ($username) "

    # print repository info
    $Global:GitPromptSettings.AfterText = '] '
    Write-VcsStatus

    # print virtual environment info
    if ($env:VIRTUAL_ENV) {
        $envname = "($(split-path $env:VIRTUAL_ENV -leaf))"
        write-host -ForegroundColor DarkGray "$envname"
    }

    # restore exit code
    $global:LASTEXITCODE = $realLASTEXITCODE

    # return prompt char
    $p = "% "
    if ([Console]::CursorLeft -ne 0) {
        $p = "`n" + $p
    }
    return $p
}

Enable-GitColors
Pop-Location
Start-SshAgent -Quiet