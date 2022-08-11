#!/bin/sh

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
      bat \
      ripgrep \
      exa \
      fzf \
      tmux \
      neovim \
      glow


#Install FZF
#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

#Install fd
#sudo apt-get install fd-find -y
sudo ln -fs /usr/bin/fdfind /usr/bin/fd

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
curl https://pyenv.run | bash
exec $SHELL

#WAKATIME
#sudo $HOME/.pyenv/shims/pip install wakatime
python3 -c "$(wget -q -O - https://raw.githubusercontent.com/wakatime/vim-wakatime/master/scripts/install_cli.py)"

