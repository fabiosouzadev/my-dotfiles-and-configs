#!/bin/bash +e

GITCONFIG_FILE="${HOME}/.gitconfig.local"

if [ -f .env ]; then

  eval $(cat .env | sed 's/^/export /')
  
  #GIT
  if [ ! -z "$GIT_FULL_NAME" ] || [ ! -z "$GIT_EMAIL" ]; then
    GITCONFIG_CONF="[user]
      name  = $GIT_FULL_NAME
      email = $GIT_EMAIL"
    echo "${GITCONFIG_CONF}" | tee -a "${GITCONFIG_FILE}"
  fi
else
  echo "You need to write a .env file. Use example.env to create it!!!"
  exit 1
fi
