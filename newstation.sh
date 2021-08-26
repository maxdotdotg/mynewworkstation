#!/bin/bash
# Script to set up preferred tools on a new Ubuntu workstation

# update and upgrade the system with apt-get
sudo apt-get update -y && sudo apt-get upgrade -y

# Install software that I tend to use on most machines
sudo apt-get install -y git zsh python3-pip tmux neovim curl jq

# set up vimrc
wget https://raw.githubusercontent.com/maxdotdotg/mynewworkstation/master/.vimrc

# set up tmux config
wget https://raw.githubusercontent.com/maxdotdotg/mynewworkstation/master/.tmux.conf

# install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# set default editor to nvim
echo "export EDITOR=nvim" >> ~/.zshrc

# add pip bins to path    
echo "export PATH=$PATH:/home/max/.local/bin" >> ~/.zshrc

# install tfenv and add to path
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo "export PATH=$PATH:~/.tfenv/bin" >> ~/.zshrc


