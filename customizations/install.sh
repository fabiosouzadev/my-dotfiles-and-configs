#!/bin/sh

# Install Zgenom
git clone https://github.com/jandamm/zgenom.git $HOME/zgenom

# Copy files to $HOME
cp -a zsh/. $HOME


if [ $(uname -a | grep -ci Darwin) = 1 ]; then
  echo "\nexport RUST_BACKTRACE=1" | tee -a $HOME/.zshrc
fi


if [ -f ../.env ]; then

  eval $(cat ../.env | sed 's/^/export /')
  
  if [ ! -z "$GIT_NAME" ] || [ ! -z "$GIT_EMAIL" ]; then
    GITCONFIG_FILE="${HOME}/.gitconfig"
    GITCONFIG_CONF="[user]
      name  = $GIT_NAME
      email = $GIT_EMAIL"
    echo "\n${GITCONFIG_CONF}" | tee -a "${GITCONFIG_FILE}"
  fi
  
  # WAKATIME
  if [ ! -z "$WAKATIME_API_KEY" ]; then
    pip install wakatime
    echo "\nexport WAKATIME_API_KEY=${WAKATIME_API_KEY}" | tee -a $HOME/.zshrc
    echo "\nexport ZSH_WAKATIME_BIN=$(which wakatime)" | tee -a $HOME/.zshrc
    echo "\nexport PATH=\$PATH:$(which wakatime)" | tee -a $HOME/.zshrc
  fi
  
else
  echo "You need to write a .env file. Use example.env to create yours"
  exit 1
fi

