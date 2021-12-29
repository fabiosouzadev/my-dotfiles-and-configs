#!/bin/sh

#compaudit | xargs chmod g-w,o-w
#echo 'PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"' | tee -a "${HOME}/.zshrc"
#echo 'autoload bashcompinit && bashcompinit' | tee -a "${HOME}/.zshrc"


if [ $(uname -a | grep -ci Darwin) = 1 ]; then
  
  # install homebrew if it's missing
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing homebrew"
    #Install Brew
    xcode-select --install
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew doctor
  fi

  if [ ! -f "$HOME/.Brewfile" ]; then
    ln -sfn $PWD/..brew/.Brewfile $HOME/.Brewfile
  fi
    
  echo "Updating homebrew bundle"
  export HOMEBREW_BUNDLE_FILE="$HOME/.Brewfile"
  brew bundle install 

else
  sudo apt update -y
  sudo apt upgrade
  sudo apt install -y zsh
  
  #Install neovim
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install neovim

  #Install stow
  sudo apt-get -y install stow  
  
  #Install FZF
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  sudo apt install -y ripgrep
  sudo apt install -y silversearcher-ag

  #Install fd
  sudo apt-get install fd-find -y
  sudo ln -s /usr/bin/fdfind /usr/bin/fd

  #Install bat
  sudo apt-get install bat -y
  mkdir -p ~/.local/bin
  sudo ln -s /usr/bin/batcat /usr/bin/bat

  #Install direnv
  sudo apt-get install direnv -y

  #EXA
  sudo apt-get install unzip -y
  wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip
  sudo unzip exa-linux-x86_64-v0.10.0.zip -d /usr/local
  sudo rm -rf exa-linux-x86_64-v0.10.0.zip

  #Install delta
  wget https://github.com/dandavison/delta/releases/download/0.9.2/git-delta_0.9.2_amd64.deb
  sudo dpkg -i git-delta_0.9.2_amd64.deb
  sudo rm -rf git-delta_0.9.2_amd64.deb

  #Install lazydocker
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | sh
  sudo rm -rf lazydocker

  #Instalar Go
  sudo apt install golang -y

  #Install glow (.md)
  git clone https://github.com/charmbracelet/glow.git
  cd glow
  /usr/bin/go build
  sudo cp glow /usr/bin/
  cd ..
  sudo rm -r glow/

  #Instalar GH (Github)
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt update
  sudo apt install gh

  #Install lazygit
  sudo add-apt-repository ppa:lazygit-team/release
  sudo apt-get update
  sudo apt-get install lazygit
  
  #Install lazydocker
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
  
  #Install neofetch
  sudo apt install -y neofetch

  #Install asdf
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf

  #Install ranger
  sudo apt-get install ranger
  #Customize fonts
  fc-cache -vf ~/.fonts/
fi

chsh -s /usr/local/bin/zsh

# Install nmv
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin


