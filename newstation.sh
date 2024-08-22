#!/bin/bash
# Script to set up preferred tools on a new Ubuntu workstation

# update and upgrade the system with apt-get
sudo apt-get update -y && sudo apt-get upgrade -y

# Install software that I tend to use on most machines
sudo apt-get install -y git zsh python3-pip tmux neovim curl jq pipx vlc

# get vimrc
curl https://raw.githubusercontent.com/maxdotdotg/mynewworkstation/master/.vimrc -o ~/.vimrc

# get tmux config
curl https://raw.githubusercontent.com/maxdotdotg/mynewworkstation/master/.tmux.conf -o ~/.tmux.conf

# setup symlink for nvimrc
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# add oh my zsh plugins
sed -i "s/^plugins.*/plugins=(git aws terraform)/g" ~/.zshrc

# set default editor to nvim
echo "export EDITOR=nvim" >> ~/.zshrc

# add pip bins to path    
echo "export PATH=$PATH:${HOME}/.local/bin" >> ~/.zshrc

# install tfenv and add to path
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo "export PATH=$PATH:${HOME}/.tfenv/bin" >> ~/.zshrc

## install docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

## install kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list   # helps tools such as command-not-found to work correctly
sudo apt-get update
sudo apt-get install -y kubectl
