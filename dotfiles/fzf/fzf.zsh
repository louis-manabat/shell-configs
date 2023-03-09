# Setup fzf
# ---------
if [[ ! "$PATH" == */home/maabat/repos/shell-configs/dotfiles/zsh/plugins/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/maabat/repos/shell-configs/dotfiles/zsh/plugins/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$XDG_CONFIG_HOME/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$XDG_CONFIG_HOME/fzf/key-bindings.zsh"
