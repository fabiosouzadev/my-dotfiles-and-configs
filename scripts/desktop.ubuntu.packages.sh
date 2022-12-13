#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install curl
#Add to sources list

#Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg arch=amd64] https://brave-browser-apt-nightly.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list

#Update sources
sudo apt-get update

sudo apt install -y \
    apt-transport-https \
    gnome-tweaks \
    snapd \
    vpnc \
    caffeine \
    libqt5webkit5 \
    network-manager-vpnc \
    network-manager-vpnc-gnome \
    brave-browser 

sudo snap install \
    authy \
    bitwarden \
    notion-snap \
    dbeaver-ce \
    postman \
    insomnia \
    whatsapp-for-linux \
    telegram-desktop \
    vlc \
    slack


#Install toogl
TOGGL_VERSION="7.5.324"
wget -O "toggl.deb" "https://github.com/toggl-open-source/toggldesktop/releases/download/v${TOGGL_VERSION}/toggldesktop_${TOGGL_VERSION}_ubuntu1604_amd64.deb"
sudo dpkg -i "toggl.deb"
sudo apt-get install -fy
sudo rm toggl.deb

# Install yt-dlp
sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
