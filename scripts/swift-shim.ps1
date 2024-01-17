#!/usr/bin/env pwsh

$OldPath = $env:Path ?? $env:PATH
$env:PATH = ''
$env:Path = $OldPath
swift.exe @args
if (-not $?) {throw "swift exited with code $?"}