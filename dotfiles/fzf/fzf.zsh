# Setup fzf
# ---------
if [[ ! "$PATH" == "$ZSHPLUGINS/fzf/bin" ]]; then
  PATH="${PATH:+${PATH}:}$ZSHPLUGINS/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$XDG_CONFIG_HOME/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$XDG_CONFIG_HOME/fzf/key-bindings.zsh"
