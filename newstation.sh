#!/bin/bash
# Script to set up preferred tools on a new Ubuntu workstation

# update and upgrade the system with apt-get
sudo apt-get update -y && sudo apt-get upgrade -y

# Install software that I tend to use on most machines
sudo apt-get install -y git zsh python-pip tmux vim

# install oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git
cd ~/.zsh
make install

#Change default shell from bash to zsh
sudo chsh -s /usr/bin/zsh

# set default editor to vim
echo "export EDITOR=vim" >> ~/.zshrc

# add scripts to path
echo "export PATH=$PATH:~/scripts" >> ~/.zshrc

# add go to path
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc

