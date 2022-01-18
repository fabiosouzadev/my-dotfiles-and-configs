#!/bin/sh

sudo apt-get install -y zsh \
      golang \
      unzip \
      direnv \
      neofetch \
      silversearcher-ag \
      ranger

#Install neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim

#Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

#Install fd
sudo apt-get install fd-find -y
sudo ln -fs /usr/bin/fdfind /usr/bin/fd

#Install bat and ripgrep
sudo apt install -o -y Dpkg::Options::="--force-overwrite" bat ripgrep
sudo ln -fs /usr/bin/batcat /usr/bin/bat

#EXA
wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip
sudo unzip -f exa-linux-x86_64-v0.10.0.zip -d /usr/local
sudo rm -rf exa-linux-x86_64-v0.10.0.zip

#Install delta
wget https://github.com/dandavison/delta/releases/download/0.9.2/git-delta_0.9.2_amd64.deb
sudo dpkg -i git-delta_0.9.2_amd64.deb
sudo rm -rf git-delta_0.9.2_amd64.deb

#Lazygit
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install -y lazygit

#Install lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
sudo mv lazydocker /usr/local/bin

#Instalar GH (Github)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt-get update
sudo apt-get install -y gh

#Install glow (.md)
git clone https://github.com/charmbracelet/glow.git ~/glow
cd ~/glow
/usr/bin/go build
sudo cp glow /usr/bin/
sudo rm -r -f ~/glow

#WAKATIME
sudo pip install wakatime