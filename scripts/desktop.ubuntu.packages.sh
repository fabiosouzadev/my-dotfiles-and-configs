#!/bin/bash

#Add to sources list

#Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

#Update sources
sudo apt-get update

sudo apt install -y \
    apt-transport-https \
    curl \
    gnome-tweaks \
    snapd \
    vpnc \
    caffeine \
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

# Install youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl


#Install kitty
if [ ! -f ~/.local/bin/kitty ]; then
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
  cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
  cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
  sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
  sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
fi
