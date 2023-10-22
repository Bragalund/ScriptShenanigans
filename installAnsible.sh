
#!/bin/bash

# Adding ansible-repo to apt, because apt does not come with the newest version ansible
sudo apt-add-repository -y ppa:ansible/ansible;

# updating and upgrading system
sudo apt update -y && sudo apt upgrade -y;

# installing ansible with apt
sudo apt install ansible -y; 

# verifying installation
command -v ansible > /dev/null 2>&1 || { echo >&2 "Ansible was not installed for some reason... "; return 1;}

# printing the ansible version
echo "\n The installed ansible version is: \n";
ansible --version;

