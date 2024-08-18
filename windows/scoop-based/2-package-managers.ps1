#!/usr/bin/env powershell
# 2-package-managers.ps1

iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)} -RunAsAdmin"
scoop bucket add main
scoop bucket add extras
