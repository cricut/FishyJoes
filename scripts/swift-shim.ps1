#!/usr/bin/env powershell

$ErrorActionPreference = "Stop"
$DebugPreference = "Continue"

# Swift does not properly read Windows "PATH" variable, instead trying to read "Path" only.
# See: https://github.com/apple/swift-tools-support-core/issues/446
# Also de-duplicate the path, as external tools seem to have a propensity to mangle the path
# but the max length of an environment variable is 8192 (minus var name length & '=;')
$CurrentPath = if ($env:Path -ne $null) { $env:Path } else { $env:PATH }
$DeduplicatedPath = ($CurrentPath -split ';' | Select-Object -Unique) -join ';'
$env:PATH = ''
$env:Path = $DeduplicatedPath

gci Env:PATH | Format-List

# Perform execution and report errors encountered
swift.exe @args
if (-not $?) { throw "swift exited with code $LastExitCode" }
