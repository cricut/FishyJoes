#!/usr/bin/env powershell

$OldPath = if ($env:Path -ne $null) { $env:Path } else { $env:PATH }
$env:PATH = ''
$env:Path = $OldPath
swift.exe @args
if (-not $?) {throw "swift exited with code $?"}