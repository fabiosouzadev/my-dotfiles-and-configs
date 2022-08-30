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

#Glow
echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list #Glow

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
      neovim \
      glow

#Config fd
sudo ln -fvs /usr/bin/fdfind /usr/bin/fd

#Lazygit
#sudo add-apt-repository ppa:lazygit-team/daily
#sudo apt-get update
#sudo apt-get install -y lazygit

#Install lazydocker
#curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
#sudo mv lazydocker /usr/local/bin

#Install delta
curl -sLO https://github.com/dandavison/delta/releases/download/0.13.0/git-delta_0.13.0_amd64.deb && sudo dpkg -i git-delta_0.13.0_amd64.deb && sudo rm git-delta_0.13.0_amd64.deb

#PYENV

if [ ! -d "$HOME/.pyenv" ];then
    curl https://pyenv.run | bash
    exec $SHELL
fi

#Install K9s
curl -sS https://webinstall.dev/k9s | sh

#WAKATIME
python3 -c "$(wget -q -O - https://raw.githubusercontent.com/wakatime/vim-wakatime/master/scripts/install_cli.py)"

#Install docker
