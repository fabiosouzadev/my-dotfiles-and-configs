# Setup fzf
# ---------
if [[ ! "$PATH" == */home/fabiosouzadev/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/fabiosouzadev/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/fabiosouzadev/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/fabiosouzadev/.fzf/shell/key-bindings.zsh"
