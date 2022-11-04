#!/bin/sh

#Configurar DNS
CONFIG_DNS="nameserver 212.102.61.80
nameserver 212.102.61.81
nameserver 8.8.8.8
nameserver 200.221.11.101"

if [ ! -d "/etc/resolvconf/resolv.conf.d/" ];then
	sudo mkdir -p "/etc/resolvconf/resolv.conf.d/"
fi

sudo apt-get install -y resolvconf
echo "${CONFIG_DNS}" | sudo tee -a /etc/resolvconf/resolv.conf.d/head
sudo resolvconf -u

# Add ppa or sources list

echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list #Glow
sudo apt-add-repository -y ppa:zanchey/asciinema #Asciinema

#Atualizar sources lists
sudo apt-get -y update

sudo apt-get install -y \
      make \
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
      wget \
      curl \
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
      gh \
      golang \
      unzip \
      direnv \
      neofetch \
      silversearcher-ag \
      ranger \
      fd-find \
      ripgrep \
      exa \
      fzf \
      tmux \
      glow \
      apache2-utils \
      asciinema

#Config fd
sudo ln -fvs /usr/bin/fdfind /usr/bin/fd

#Install delta
curl -sLO https://github.com/dandavison/delta/releases/download/0.13.0/git-delta_0.13.0_amd64.deb && sudo dpkg -i git-delta_0.13.0_amd64.deb && sudo rm git-delta_0.13.0_amd64.deb

#PYENV

if [ ! -d "$HOME/.pyenv" ];then
    curl https://pyenv.run | bash
    exec $SHELL
fi

#WAKATIME
python3 -c "$(wget -q -O - https://raw.githubusercontent.com/wakatime/vim-wakatime/master/scripts/install_cli.py)"
