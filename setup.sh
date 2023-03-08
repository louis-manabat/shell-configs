#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo '>---------------------------------'
if [[ ! -v $XDG_CONFIG_HOME ]]; then
    echo "Creating XDG_CONFIG_HOME using $HOME/.dotfiles-configs"
    XDG_CONFIG_HOME="$HOME/.dotfiles-configs"
else
    echo "Using existing XDG_CONFIG_HOME: $XDG_CONFIG_HOME"
fi
echo '>---------------------------------'

if [[ ! -d "$XDG_CONFIG_HOME" ]]; then
    echo "Creating $XDG_CONFIG_HOME"
    mkdir -p "$XDG_CONFIG_HOME"
else
    echo "$XDG_CONFIG_HOME exists"
fi
echo '>---------------------------------'

if [[ ! -f "$HOME/.zshenv" ]]; then
    echo "Creating $HOME/.zshenv symlink"
    ln -s "$SCRIPT_DIR/.zshenv" "$HOME/.zshenv"
else
    echo "$HOME/.zshenv symlink established"
fi
echo '>---------------------------------'

for dir_path in ./dotfiles/*; do
    if [ -d "$dir_path" ]; then
        dir= $(echo "$dir" | sed -r 's/^(.\/dotfiles\/)//')
        if [[ -d "$XDG_CONFIG_HOME/$dir" && ! -L "$XDG_CONFIG_HOME/$dir" ]]; then
            rm -rf "$XDG_CONFIG_HOME/$dir" "$XDG_CONFIG_HOME/$dir"
            echo "Deleting and replacing $XDG_CONFIG_HOME/$dir as there is no link"
        fi
        echo "Creating missing symlinks"
        if [[ ! -d "$XDG_CONFIG_HOME/$dir" || ! -f "$XDG_CONFIG_HOME/$dir" || -L "$XDG_CONFIG_HOME/$dir" ]]; then
            ln -s "$SCRIPT_DIR/$dir" "$XDG_CONFIG_HOME"
        fi
    fi 
done
echo '>---------------------------------'