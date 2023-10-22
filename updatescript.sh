#!/bin/bash  

### apt
sudo apt update -y; 
sudo apt upgrade -y; 
sudo apt dist-upgrade -y;
sudo apt autoremove -y;

### Snaps  
sudo snap refresh; 

### Pip  
pip install --upgrade pip; 
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U;

### Nix  
nix-env --upgrade;

### Install latest node version with nvm  
echo "Install latest node version"
nvm install node;

### Install nvim  
function install_latest_nvim {
echo "Install latest nvim version"
curl -o /home/bragalund/programs/neovim -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x /home/bragalund/programs/neovim/nvim.appimage
./home/bragalund/programs/neovim/nvim.appimage --appimage-extract
./home/bragalund/programs/neovim/squashfs-root/AppRun --version
sudo ln -s /home/bragalund/programs/neovim/squashfs-root/AppRun /usr/bin/nvim
nvim --version
}

function cleanup_nvim_installation {
sudo apt remove neovim -y;
rm /home/bragalund/programs/neovim/nvim.appimage  
sudo rm /usr/bin/nvim
sudo rm -rf /squashfs-root
}

has_nvim=$(command -v nvim >/dev/null)
nvim_version=$(nvim --version | head -1 | grep -o '[0-9]\.[0-9]')
if ! $has_nvim; then
  echo "Nvim is not installed"
  install_latest_vim
elif [ $(echo $nvim_version >= 0.9 | bc -l) ]; then

     echo "Wrong version of Nvim is installed"
     cleanup_nvim_installation
     install_latest_nvim

    else
     echo "Nvim version 0.9 or greater is installed"
     nvim --version
fi

