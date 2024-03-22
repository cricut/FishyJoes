#!/usr/bin/env powershell

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


# Perform execution and report errors encountered
# Mix stderr and stdout to work around powershell weirdness
swift.exe @args 2>&1 | %{"$_"}
if (-not $?) {
    $Message = "swift exited with code $LastExitCode"
    gci Env:PATH | Format-List | Out-String | Write-Debug
    throw $Message
}
