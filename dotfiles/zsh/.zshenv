# XDG envs
export XDG_CONFIG_HOME="$HOME"/.dotfiles-configs
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSHALIASES="$ZDOTDIR/aliases"
export ZSHPLUGINS="$ZDOTDIR/plugins"

# Bun exports
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"