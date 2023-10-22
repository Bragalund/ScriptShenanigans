# Install hashcat on ubuntu

Created for ubuntu 18.04 and APT-package manager.

## Needed software  

1. Ansible installed

This will install ansible
```shell
curl -o installAnsible.sh https://raw.githubusercontent.com/Bragalund/ScriptShenanigans/main/installAnsible.sh
chmod +x installAnsible.sh
./installAnsible.sh
```

## How to run

```()
ansible-playbook runbook.yml -i hosts --user=bragalund  --ask-become-pass
```
