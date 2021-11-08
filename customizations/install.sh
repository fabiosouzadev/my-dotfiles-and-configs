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
    if [ $(uname -a | grep -ci Darwin) = 1 ]; then
      brew install wakatime-cli
      echo "\nexport ZSH_WAKATIME_BIN=$(which wakatime-cli)" | tee -a $HOME/.zshrc
    else
      sudo pip install wakatime
      echo "\nexport ZSH_WAKATIME_BIN=$HOME/.wakatime" | tee -a $HOME/.zshrc
    fi
    echo "\nexport WAKATIME_API_KEY=${WAKATIME_API_KEY}" | tee -a $HOME/.zshrc
    echo "\nexport PATH=\$PATH:$ZSH_WAKATIME_BIN" | tee -a $HOME/.zshrc
  fi
  
else
  echo "You need to write a .env file. Use example.env to create yours"
  exit 1
fi

echo '\nexport ZSHRC=$HOME/.zshrc' | tee -a $HOME/.zshrc


#echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#          [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm ' | tee -a $HOME/.zshrc
