#!/usr/bin/env powershell
# 6-ssh.ps1

$email =  git config get user.email
$host_name = "github.com"
$ssh_path = "${HOME}/.ssh"
$key_path = "${ssh_path}/${host_name}"

if (!(Test-Path $ssh_path)) {
    mkdir $ssh_path
}

if (!(Test-Path $key_path)) {
    ssh-keygen -t ed25519 -C $email -f $key_path
    Set-Service ssh-agent -StartupType Manual
    Start-Service ssh-agent
    ssh-add $key_path
}

echo "TODO: Please ensure the following public key is added to github. "
echo "https://$host_name/settings/keys"
cat "$key_path.pub"

$config_path = "$ssh_path/config-2"

echo $null >> "$config_path"

If (!(Get-Content "$config_path" | Select-String -Pattern "HostName ${host_name}")) {
    @"

Host ${host_name}
    HostName ${host_name}
    AddKeysToAgent yes
    IdentityFile ${key_path}
"@ | Add-Content "$config_path"
} 

