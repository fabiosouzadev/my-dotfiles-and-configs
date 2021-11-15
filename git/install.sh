#!/bin/sh

# Copy files to $HOME
cp .gitconfig  $HOME

if [ -f ../.env ]; then

  eval $(cat ../.env | sed 's/^/export /')
  
  if [ ! -z "$GIT_NAME" ] || [ ! -z "$GIT_EMAIL" ]; then
    GITCONFIG_FILE="${HOME}/.gitconfig"
    GITCONFIG_CONF="[user]
      name  = $GIT_NAME
      email = $GIT_EMAIL"
    echo "\n${GITCONFIG_CONF}" | tee -a "${GITCONFIG_FILE}"
  fi
else
  echo "You need to write a .env file. Use example.env to create yours"
  exit 1
fi