#!/bin/bash
#Script to set up preferred tools on a new Ubuntu workstation

echo "Running apt-get to update and upgrade the system"
echo
#Initial updates and upgrades
sudo apt-get update -y && sudo apt-get upgrade -y

echo
echo
echo "Now installing additional programs"
echo
echo
#Install software that I use on most machines
sudo apt-get install -y vlc git clamscan zsh skype python ruby python-pip openssl curl chromium-browser p7zip ubuntu-tweak

echo
echo
echo "Now removing programs that will not be used (games and ubuntu one)"
echo
echo

#Remove software that I don't use
sudo apt-get remove -y aisleriot ubuntuone gnome-sudoku gnomine gnome-mahjongg

echo
echo
echo "Running final updates and upgrades, just in case"
echo
echo
#Final updates and upgrades, just in case
sudo apt-get update -y && sudo apt-get upgrade -y

echo
echo
echo "Cloning Eddy's zsh setup and setting it up."
echo
echo
#Clone zsh config and setup
git clone git://github.com/luchasei/zsh-config.git ~/.zsh
cd ~/.zsh
make install

echo
echo
echo "Now changing the default shell to zsh"
echo
echo
#Change default shell bash to zsh
sudo chsh -s /usr/bin/zsh


echo
echo
echo "And now updating the EDITOR variable to nano, because I don't know vi"
echo
echo
#Change environmental variable EDITOR from vi to nano
cd ~/
export EDITOR=nano
source ~/.zshrch


echo
echo
echo "REMEMBER TO CONFIRM ZSH IS WORKING!"
echo " IF IT'S NOT, ADD CUSTOM COMMAND IN TERMINAL PROFILE TO USE ZSH!!"
echo


