#!/usr/bin/env powershell
# 0-manual-steps.ps1

Get-ExecutionPolicy
$defaultExecutionPolicy = Get-ExecutionPolicy

Set-ExecutionPolicy Unrestricted -Scope CurrentUser