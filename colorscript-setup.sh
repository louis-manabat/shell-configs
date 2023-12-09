#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8

if !command -v pokemon-colorscripts >/dev/null 2>&1; then
    echo '>---------------------------------'

    # Subshell process to install pokemon-colorscripts
    echo 'Installing pokemon-colorscripts'
    (
        cd submodules/pokemon-colorscripts
        sudo ./install.sh
    )
fi