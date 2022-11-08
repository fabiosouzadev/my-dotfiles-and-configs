#!/bin/bash +e

GITCONFIG_FILE="${HOME}/.gitconfig.local"
GITCONFIG_WORK_FILE="${HOME}/.gitconfig.work"

if [ -f .env ]; then

  eval $(cat .env | sed 's/^/export /')
  
  #GIT
  if [ ! -z "$GIT_FULL_NAME" ] || [ ! -z "$GIT_EMAIL" ]; then
    GITCONFIG_CONF="[user]
    name  = $GIT_FULL_NAME
    email = $GIT_EMAIL"
    echo "${GITCONFIG_CONF}" | tee "${GITCONFIG_FILE}"
  fi
  if [ ! -z "$GIT_WORK_FULL_NAME" ] || [ ! -z "$GIT_WORK_EMAIL" ] || [ ! -z "$GIT_WORK_USER" ] || [ ! -z "$GIT_WORK_SSH_KEY" ]; then
    GITCONFIG_WORK_CONF="[user]
    name  = $GIT_WORK_FULL_NAME
    email = $GIT_WORK_EMAIL
    user  = $GIT_WORK_USER
    [core]
    sshCommand = \"ssh -i ${GIT_WORK_SSH_KEY}\" "
    echo "${GITCONFIG_WORK_CONF}" | tee "${GITCONFIG_WORK_FILE}"
  fi
else
  echo "You need to write a .env file. Use env/example.env to create it !!!"
  exit 1
fi
