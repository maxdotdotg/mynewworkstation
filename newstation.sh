#!/bin/bash
#Script to set up preferred tools on a new Ubuntu workstation

# update and upgrade the system with apt-get
sudo apt-get update -y && sudo apt-get upgrade -y

# Install software that I tend to use on most machines
sudo apt-get install -y vlc git zsh skype python ruby python-pip openssl curl chromium-browser p7zip

#Remove software that I don't use
sudo apt-get remove -y aisleriot gnome-sudoku gnomine gnome-mahjongg

#Final updates and upgrades, just in case
sudo apt-get update -y && sudo apt-get upgrade -y

#Clone Eddy's zsh config and setup
git clone git://github.com/luchasei/zsh-config.git ~/.zsh
cd ~/.zsh
make install

#Change default shell from bash to zsh
sudo chsh -s /usr/bin/zsh
zsh

#Change environmental variable EDITOR from vi to nano
# because I like nano
cd ~/
export EDITOR=nano
source ~/.zshrc


echo
echo
echo "REMEMBER TO CONFIRM ZSH IS WORKING BY OPENING A NEW TERMINAL!"
echo "IF IT'S NOT, ADD CUSTOM COMMAND IN TERMINAL PROFILE TO USE ZSH!!"
echo
