Windows swift setup (5.10)

Settings > System > For developers > "Developer Mode" on

In powershell:

winget install --id Microsoft.VisualStudio.2022.Professional --exact --force --custom "--add Microsoft.VisualStudio.Component.Windows11SDK.22000 --add Microsoft.VisualStudio.Component.VC.14.38.17.8.x86.x64 --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.VC.Tools.ARM64"

winget install --id Swift.Toolchain --exact --force --version 5.10.1 -e

winget install --id GitHub.cli

git clone https://github.com/microsoft/vcpkg.git

cd vcpkg; .\bootstrap-vcpkg.bat; [Environment]::SetEnvironmentVariable("VCPKG_ROOT", $PWD, "User")

(relaunch shell)

& "$env:VCPKG_ROOT\vcpkg.exe" install openssl:x64-windows-static

gh auth login

cmd /k "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars64.bat" x64 "-vcvars_ver=14.38"

swift build