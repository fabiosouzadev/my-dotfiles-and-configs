#!/bin/sh

# Install Zgenom
git clone https://github.com/jandamm/zgenom.git $HOME/zgenom

# Copy files to $HOME
#cp -a zsh/. $HOME
stow --target=$HOME dotfiles --ignore='.gitconfig' -vvv
cp -a dotfiles/.gitconfig  $HOME

create_custom_zshrc_configs(){
  if [ !  -n "$(/bin/ls -A $HOME/.zshrc.d)" ]; then
    mkdir -p $HOME/.zshrc.d
  fi  
}

RUST_ENV_FILE=$HOME/.zshrc.d/00-rust.zsh
WAKATIME_SCRIPT_FILE=$HOME/.zshrc.d/01-wakatime.zsh
NNN_ENV_FILE=$HOME/.zshrc.d/02-nnn.zsh
NVM_ENV_FILE=$HOME/.zshrc.d/03-nvm.zsh

# create zshrc.d
create_custom_zshrc_configs

if [ $(uname -a | grep -ci Darwin) = 1 ]; then
  echo "export RUST_BACKTRACE=1" | tee "${RUST_ENV_FILE}"
fi

if [ -f ../.env ]; then

  eval $(cat ../.env | sed 's/^/export /')
  #GIT
  if [ ! -z "$GIT_FULL_NAME" ] || [ ! -z "$GIT_EMAIL" ]; then
    GITCONFIG_FILE="${HOME}/.gitconfig"
    GITCONFIG_CONF="[user]
      name  = $GIT_FULL_NAME
      email = $GIT_EMAIL"
    echo "\n${GITCONFIG_CONF}" | tee -a "${GITCONFIG_FILE}"
  fi  
  # WAKATIME
  if [ ! -z "$WAKATIME_API_KEY" ]; then
    if [ $(uname -a | grep -ci Darwin) = 1 ]; then
      brew install wakatime-cli
      echo "export ZSH_WAKATIME_BIN=$(which wakatime-cli)" | tee $WAKATIME_SCRIPT_FILE
    else
      sudo pip install wakatime
      echo "export ZSH_WAKATIME_BIN=$(which wakatime)" | tee -a $WAKATIME_SCRIPT_FILE
    fi
    echo "export WAKATIME_API_KEY=${WAKATIME_API_KEY}" | tee -a $WAKATIME_SCRIPT_FILE
    echo "export PATH=\$PATH:\$ZSH_WAKATIME_BIN" | tee -a $WAKATIME_SCRIPT_FILE
  fi
  
else
  echo "You need to write a .env file. Use example.env to create yours"
  exit 1
fi

#VIM/NEOVIM


#Install Plug
if [ -d "$HOME/.local/share/nvim" ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        
  if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir -p "$HOME/.config/nvim"
  fi  

  ln -fsv $HOME/.vimrc $HOME/.config/nvim/init.vim

else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#NNN
echo "export NNN_PLUG='f:finder;p:preview-tui;v:imgview'" | tee $NNN_ENV_FILE

#NVM
CONFIG_NVM="export NVM_DIR=\"\$HOME/.nvm\"
\n[ -s \"\$NVM_DIR/nvm.sh\" ] && \\. \"\$NVM_DIR/nvm.sh\"  # This loads nvm
\n[ -s \"\$NVM_DIR/bash_completion\" ] && \\. \"\$NVM_DIR/bash_completion\"  # This loads nvm bash_completion"
echo $CONFIG_NVM | tee $NVM_ENV_FILE 