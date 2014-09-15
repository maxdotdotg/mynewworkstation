#!/bin/bash
#Script to set up preferred tools on a new workstation

#Initial updates and upgrades
sudo apt-get update -y && sudo apt-get upgrade -y

#Install software that I use on most machines
sudo apt-get install -y vlc git clamscan zsh skype python ruby pip openssl curl chromium-browser p7zip ubuntu-tweak

#Remove software that I don't use
sudo apt-get remove aisleriot ubuntuone gnome-sudoku gnomine gnome-mahjongg

#Final updates and upgrades, just in case
sudo apt-get update -y && sudo apt-get upgrade -y

#Clone zsh config and setup
git clone git://github.com/luchasei/zsh-config.git ~/.zsh
cd ~/.zsh
make install

echo
echo "REMEMBER TO ADD CUSTOM COMMAND IN TERMINAL PROFILE TO USE ZSH!!"
echo


