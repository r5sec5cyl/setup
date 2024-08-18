#!/usr/bin/env powershell
# 5-languages.ps1

choco -v
choco install go python rust zig
choco install vscode-go vscode-python

$confirmation = Read-Host "Install node (via Fast Node Manager)"
if ($confirmation -eq 'y') {
    choco install fnm -y
    fnm env --use-on-cd | Out-String | Invoke-Expression
    fnm use --install-if-missing 20
}
