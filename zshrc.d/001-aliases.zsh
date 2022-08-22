## CHECK IF NVIM
if [ -x /bin/nvim ]; then
    alias vi="/bin/nvim"
    alias vim="/bin/nvim"
    export EDITOR="/bin/nvim"
fi

if [ -x /usr/bin/nvim ]; then
    alias vi="/usr/bin/nvim"
    alias vim="/usr/bin/nvim"
    export EDITOR="/usr/bin/nvim"
fi

if [ -x /opt/local/bin/nvim ]; then
    alias vim="/opt/local/bin/nvim"
    alias vi="/opt/local/bin/nvim"
    export EDITOR="/opt/local/bin/nvim"
fi
if [ -x /usr/local/bin/nvim ]; then
    alias vim="/usr/local/bin/nvim"
    alias vi="/usr/local/bin/nvim"
    export EDITOR="/usr/local/bin/nvim"
fi

# Clearly, I also really like nvim.

#ALIAS
alias zc="${EDITOR}  ~/.zshrc"
alias hc="sudo ${EDITOR} /etc/hosts"
alias ls="exa"
alias lll='exa -alh'
alias cat='bat'

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

#Lazygit and Lazydocker
alias lg="lazygit"
alias ld="lazydocker"

alias showhidden="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"



