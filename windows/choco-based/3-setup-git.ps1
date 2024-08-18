﻿#!/usr/bin/env powershell
# 3-setup-git.ps1

choco install git.install
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
refreshenv

echo "Configure git global config: "
$git_name = Read-Host "name"
$git_email = Read-Host "email"

git config --global --replace-all user.name "$git_name"
git config --global --replace-all user.email "$git_email"
