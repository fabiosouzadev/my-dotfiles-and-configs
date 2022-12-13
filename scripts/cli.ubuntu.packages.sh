#!/bin/bash

# Add ppa or sources list
# echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list #Glow
sudo apt-add-repository -y ppa:zanchey/asciinema #Asciinema
sudo add-apt-repository -y ppa:peek-developers/stable


#Atualizar sources lists
sudo apt-get -y update

sudo apt-get install -y \

      make \
      wget \
      curl \
      xsel \
      fzf \
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
      software-properties-common \
      zsh \
#     gh \
      golang \
      unzip \
      direnv \
      neofetch \
      silversearcher-ag \
      ranger \
      fd-find \
      ripgrep \
      fzf \
      tmux \
 #     glow \
      apache2-utils \
      asciinema \
      peek \
      clang \
      cmake \
      ninja-build \
      pkg-config \
      libgtk-3-dev \
      libfreetype6-dev \
      libfontconfig1-dev \
      libxcb-xfixes0-dev \
      libxkbcommon-dev \
      kubectx \
      rofi \
      gcc \
      clang \
      make 

#Config fd
sudo ln -fvs /usr/bin/fdfind /usr/bin/fd

#Install delta
curl -sLO https://github.com/dandavison/delta/releases/download/0.13.0/git-delta_0.13.0_amd64.deb && sudo dpkg -i git-delta_0.13.0_amd64.deb && sudo rm git-delta_0.13.0_amd64.deb

#Install exa
EXA_VERSION=$(curl -s "https://api.github.com/repos/ogham/exa/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo exa.zip "https://github.com/ogham/exa/releases/latest/download/exa-linux-x86_64-v${EXA_VERSION}.zip"
sudo unzip -q exa.zip bin/exa -d /usr/local
rm -rf exa.zip

#Install ripgrep
RIPGREP_VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name": "\K[0-9.]+')
curl -Lo ripgrep.deb "https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep_${RIPGREP_VERSION}_amd64.deb"
sudo apt install -y ./ripgrep.deb
rm -rf ripgrep.deb

#WAKATIME
python3 -c "$(wget -q -O - https://raw.githubusercontent.com/wakatime/vim-wakatime/master/scripts/install_cli.py)"
