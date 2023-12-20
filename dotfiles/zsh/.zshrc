# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2

# Custom if statement to compenstate for the issues with Mac not recognising dircolors
# StackExchange: https://unix.stackexchange.com/a/91978/429940
if whence dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
else
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
fi

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
source "$ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

# Use modern completion system
autoload -Uz compinit
compinit

###################################
# End of lines added by compinstall
###################################

#-----------------------------------------------------------------------------

########################
# Start of custom config
########################

# Source fzf
[ -f "$XDG_CONFIG_HOME/fzf/fzf.zsh" ] && source "$XDG_CONFIG_HOME/fzf/fzf.zsh"

# fzf-tab init
source "$ZSHPLUGINS/fzf-tab/fzf-tab.plugin.zsh"

# zsh aliases
source "$ZDOTDIR/aliases.zsh"

# Sourcing the alias file to make the commands runnable
for f in $ZSHALIASES/*; do
  source $f
done

#------------------------------------------------------
# Conditional inits start - package needs to be install
#------------------------------------------------------

# Zoxide init
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# kubectl autocompletion
if command -v kubectl >/dev/null 2>&1; then
  source "$XDG_CONFIG_HOME/k3s/zsh_completion"
fi

# Run the pokemon-colorscripts package if it exists
# Note: Keep this at the end of the .zshrc file as it needs to run last after setup
if command -v pokemon-colorscripts >/dev/null 2>&1; then
  shiny_arg=""

  if [ $(shuf -i 1-1365 -n 1) -eq 393 ]; then
    shiny_arg="-s"
  fi

  if [ $(( $(shuf -i 1-100 -n 1) % 2)) -eq 0 ]; then
    pokemon-colorscripts -n piplup $shiny_arg
  else
    pokemon-colorscripts -r $shiny_arg
  fi
fi