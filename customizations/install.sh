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

GITCONFIG_FILE=$HOME/.zshrc.d/00-gitconfig.zsh
RUST_ENV_FILE=$HOME/.zshrc.d/01-rust.zsh
WAKATIME_SCRIPT_FILE=$HOME/.zshrc.d/02-wakatime.zsh
NNN_ENV_FILE=$HOME/.zshrc.d/03-nnn.zsh

if [ $(uname -a | grep -ci Darwin) = 1 ]; then
  create_custom_zshrc_configs
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
    create_custom_zshrc_configs
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

#VIM

#Install Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#NNN
echo "export NNN_PLUG='f:finder;p:preview-tui;v:imgview'" | tee $NNN_ENV_FILE