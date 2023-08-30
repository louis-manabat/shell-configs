# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/bin/fzf* ]]; then
  PATH="${PATH:+${PATH}:}/usr/bin/fzf"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$XDG_CONFIG_HOME/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$XDG_CONFIG_HOME/fzf/key-bindings.zsh"
