#!/bin/bash

#Add to sources list

#Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Cafeine 
sudo add-apt-repository ppa:caffeine-developers/ppa

#Ulauncher
sudo apt update && sudo apt install -y gnupg
gpg --keyserver keyserver.ubuntu.com --recv 0xfaf1020699503176
gpg --export 0xfaf1020699503176 | sudo tee /usr/share/keyrings/ulauncher-archive-keyring.gpg
sudo echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] http://ppa.launchpad.net/agornostal/ulauncher/ubuntu focal main" > /etc/apt/sources.list.d/ulauncher-focal.list
sudo apt update && sudo apt install ulaunchersudo add-apt-repository ppa:agornostal/ulauncher

#Update sources
sudo apt-get update



sudo apt-get install -y \
    apt-transport-https \
    curl \
    gnome-tweaks \
    snapd \
    slack \
    brave-browser \
    caffeine \
    vlc \
    gnome-twitch 

sudo snap install \
    authy \
    bitwarden \
    notion-snap \
    spotify \
    dbeaver-ce \
    postman \
    insomnia \
    whatsapp-for-linux \
    telegram-desktop

#Install brave