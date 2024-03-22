#!/usr/bin/env powershell

# ??!?? https://github.com/PowerShell/PowerShell/issues/14100
Import-Module Microsoft.PowerShell.Utility;

$ErrorActionPreference = "Stop"
$DebugPreference = "Continue"
# Set-PSDebug -Trace 1

# Swift does not properly read Windows "PATH" variable, instead trying to read "Path" only.
# See: https://github.com/apple/swift-tools-support-core/issues/446
# Also de-duplicate the path, as external tools seem to have a propensity to mangle the path
# but the max length of an environment variable is 8192 (minus var name length & '=;')
$CurrentPath = if ($env:Path -ne $null) { $env:Path } else { $env:PATH }
$DeduplicatedPath = ($CurrentPath -split ';' | Select-Object -Unique) -join ';'
$env:PATH = ''
$env:Path = $DeduplicatedPath

# Collect stderr to work around powershell weirdness
$SwiftErrorLog = New-TemporaryFile

# Perform execution and report errors encountered
swift.exe @args 2> $SwiftErrorLog
$SwiftExit = $?
$SwiftExitMessage = "swift exited with code $LastExitCode"

echo "=== BEGIN SWIFT ERROR ==="
cat $SwiftErrorlog
echo "=== end SWIFT ERROR ==="
rm $SwiftErrorlog

if (-not $SwiftExit) {
    gci Env:PATH | Format-List | Out-String | Write-Debug
    throw $SwiftExitMessage
}
