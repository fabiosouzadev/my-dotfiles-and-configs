#!/bin/sh

#compaudit | xargs chmod g-w,o-w
#echo 'PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"' | tee -a "${HOME}/.zshrc"
#echo 'autoload bashcompinit && bashcompinit' | tee -a "${HOME}/.zshrc"


if [ $(uname -a | grep -ci Darwin) = 1 ]; then
  #Install Brew
  xcode-select --install
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update
	brew doctor

  #Install FZF
  brew install fzf
  brew install fd
  brew install bat
  brew install direnv
  brew install exa
  brew install git-delta
  brew install lazydocker
  brew install glow
  brew install gh
  brew install fzf
  brew install tree
  brew install --cask google-cloud-sdk
  #Install stow
  brew install stow
  
else
  sudo apt update -y
  sudo apt upgrade
  sudo apt install -y zsh
  
  #Install stow
  sudo apt-get -y install stow  
  
  #Install FZF
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install

  #Install fd
  sudo apt-get install fd-find -y

  #Install bat
  sudo apt-get install bat -y
  mkdir -p ~/.local/bin
  sudo ln -s /usr/bin/batcat /usr/bin/bat

  sudo apt-get install direnv -y

  #EXA
  sudo apt-get install unzip -y
  wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip
  sudo unzip exa-linux-x86_64-v0.10.0.zip -d /usr/local

  #Install delta
  wget https://github.com/dandavison/delta/releases/download/0.9.2/git-delta_0.9.2_amd64.deb
  sudo dpkg -i git-delta_0.9.2_amd64.deb

  #Install lazydocker
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

  #Instalar Go
  sudo apt install golang -y

  #Install glow (.md)
  git clone https://github.com/charmbracelet/glow.git
  cd glow
  /usr/bin/go build
  sudo cp glow /usr/bin/

  #Instalar GH (Github)
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt update
  sudo apt install gh

  #Customize fonts
  fc-cache -vf ~/.fonts/
fi

chsh -s /usr/local/bin/zsh




