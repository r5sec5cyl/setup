#!/usr/bin/env powershell
# 5-languages.ps1

scoop install main/go
scoop install main/python
scoop install main/rust
scoop install main/zig

$confirmation = Read-Host "Install node (via Fast Node Manager)"
if ($confirmation -eq 'y') {
    scoop install main/fnm
    fnm env --use-on-cd | Out-String | Invoke-Expression
    fnm use --install-if-missing 20
}
