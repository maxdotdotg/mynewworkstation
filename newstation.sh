#!/bin/bash
# Script to set up preferred tools on a new Ubuntu workstation

# update and upgrade the system with apt-get
sudo apt-get update -y && sudo apt-get upgrade -y

# Install software that I tend to use on most machines
sudo apt-get install -y git zsh python-pip tmux vim

# install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# set default editor to vim
echo "export EDITOR=vim" >> ~/.zshrc

# add scripts to path
echo "export PATH=$PATH:~/scripts" >> ~/.zshrc

# add go to path
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc
