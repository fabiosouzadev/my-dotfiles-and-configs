export USE_GKE_GCLOUD_AUTH_PLUGIN=True
#export PATH=$HOME/.local/src/google-cloud-sdk/bin:$PATH


# OBS: Not working completion in ~/.local/share/zsh/site-functions/
source $HOME/.local/src/google-cloud-sdk/path.zsh.inc
autoload -U compinit compdef
compinit
source $HOME/.local/src/google-cloud-sdk/completion.zsh.inc
