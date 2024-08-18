#!/usr/bin/env powershell
# 7-map-capslock.ps1

$isWin11 = (Get-WmiObject Win32_OperatingSystem).Caption -Match "Windows 11"

if ($isWin11) {
    $hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,e0,3a,00,00,00,00,00".Split(',') | % { "0x$_"};
} 
else {
    $hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};
}

$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout'

New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);

echo "Restart required for capslock key to be remapped."
