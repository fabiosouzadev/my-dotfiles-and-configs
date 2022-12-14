#!/bin/bash

# Add ppa or sources list


#Atualizar sources lists
sudo apt-get -y update

sudo apt-get install -y \
      make \
      cmake \
      gcc \
      clang \
      wget \
      curl \
      build-essential \
      libssl-dev \
      zlib1g-dev \
      libbz2-dev \
      libreadline-dev \
      libsqlite3-dev \
      lsb-release \
      ca-certificates \
      apt-transport-https \
      software-properties-common \
      llvm \
      libncursesw5-dev \
      xz-utils \
      tk-dev \
      libxml2-dev \
      libxmlsec1-dev \
      libffi-dev \
      liblzma-dev \
      libpq-dev \
      ninja-build \
      pkg-config \
      libgtk-3-dev \
      libfreetype6-dev \
      libfontconfig1-dev \
      libxcb-xfixes0-dev \
      libxkbcommon-dev \
      libqt5webkit5 \
      zsh \
      golang \
      unzip \
      direnv \
      neofetch \
      fzf \
      ripgrep \
      universal-ctags \
      silversearcher-ag \
      ranger \
      fd-find \
      xsel \
      rofi 


#Config fd
sudo ln -fvs /usr/bin/fdfind /usr/bin/fd

#Install delta
curl -sLO https://github.com/dandavison/delta/releases/download/0.13.0/git-delta_0.13.0_amd64.deb && sudo dpkg -i git-delta_0.13.0_amd64.deb && sudo rm git-delta_0.13.0_amd64.deb

#Install exa
EXA_VERSION=$(curl -s "https://api.github.com/repos/ogham/exa/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo exa.zip "https://github.com/ogham/exa/releases/latest/download/exa-linux-x86_64-v${EXA_VERSION}.zip"
sudo unzip -q exa.zip bin/exa -d /usr/local
rm -rf exa.zip

#WAKATIME
python3 -c "$(wget -q -O - https://raw.githubusercontent.com/wakatime/vim-wakatime/master/scripts/install_cli.py)"

#kubectx
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -sv /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -sv /opt/kubectx/kubens /usr/local/bin/kubens
