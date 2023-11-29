#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8

# Colours which will be used in output formatting
red='\033[0;31m'
green='\033[0;32m'
nc='\033[0m'

# Location of where the bash script is
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Flair to determine if this device will be primarily be used for Pi-Hole only
rasp_pi_hole=false

while [ $# -gt 0 ]; do
    case "$1" in
        -ph|--pihole)
            rasp_pi_hole=true
            ;;
        *)
            echo "Invalid flag: $1" >&2
            exit 1
            ;;
    esac
    shift
done

echo '>---------------------------------'
if [[ -v $XDG_CONFIG_HOME || -z $XDG_CONFIG_HOME ]]; then
    echo -e "Creating XDG_CONFIG_HOME using ${red}$HOME/.dotfiles-configs${nc}"
    XDG_CONFIG_HOME="$HOME/.dotfiles-configs"
else
    echo "Using existing XDG_CONFIG_HOME: ${red}$XDG_CONFIG_HOME${ncg}"
fi
echo '>---------------------------------'

if [[ ! -d "$XDG_CONFIG_HOME" ]]; then
    echo "Creating ${red}$XDG_CONFIG_HOME${nc}"
    mkdir -p "$XDG_CONFIG_HOME"
else
    echo "XDG_CONFIG_HOME exists: ${red}$XDG_CONFIG_HOME${nc}"
fi
echo '>---------------------------------'

if [[ ! -f "$HOME/.zshenv" ]]; then
    echo "Creating $HOME/.zshenv symlink"
    ln -s "$SCRIPT_DIR/.zshenv" "$HOME/.zshenv"
else
    echo "${red}$HOME/.zshenv${nc} symlink already established"
fi
echo '>---------------------------------'

if ! $rasp_pi_hole; then
    echo "******************************"
    echo "| Regular Raspberry Pi setup |"
    echo "******************************"
    for dir_path in ./dotfiles/*; do
        if [ -d "$dir_path" ]; then
            dir="$(echo "$dir_path" | sed -r 's/^(.\/dotfiles\/)//')"
            if [[ -d "$XDG_CONFIG_HOME/$dir" && ! -L "$XDG_CONFIG_HOME/$dir" ]]; then
                mv "$XDG_CONFIG_HOME/$dir" "$XDG_CONFIG_HOME/back-up/$dir.bak"
                echo "Deleting and replacing $XDG_CONFIG_HOME/$dir as there is no link"
            fi

            if [[ -d "$XDG_CONFIG_HOME/$dir" || -f "$XDG_CONFIG_HOME/$dir" || -L "$XDG_CONFIG_HOME/$dir" ]]; then
                echo -e "Directory: ${green}$dir${nc} already has a link at ${red}$XDG_CONFIG_HOME/${green}$dir${nc}"
            else
                echo -e "Creating link for ${green}$dir${nc} @ ${red}$XDG_CONFIG_HOME/${green}$dir${nc}"
                ln -s "$SCRIPT_DIR/dotfiles/$dir" "$XDG_CONFIG_HOME"
            fi
        fi
    done
elif $rasp_pi_hole; then
    echo "******************************"
    echo "| Pi-Hole Raspberry Pi setup |"
    echo "******************************"
    for dir_path in ./dotfiles/*; do
        if [ -d "$dir_path" ]; then
            dir="$(echo "$dir_path" | sed -r 's/^(.\/dotfiles\/)//')"
            if [ "$dir" != "k3s" ]; then
                if [[ -d "$XDG_CONFIG_HOME/$dir" && ! -L "$XDG_CONFIG_HOME/$dir" ]]; then
                    mv "$XDG_CONFIG_HOME/$dir" "$XDG_CONFIG_HOME/back-up/$dir.bak"
                    echo "Deleting and replacing $XDG_CONFIG_HOME/$dir as there is no link"
                fi

                if [[ -d "$XDG_CONFIG_HOME/$dir" || -f "$XDG_CONFIG_HOME/$dir" || -L "$XDG_CONFIG_HOME/$dir" ]]; then
                    echo -e "Directory: ${green}$dir${nc} already has a link at ${red}$XDG_CONFIG_HOME/${green}$dir${nc}"
                else
                    echo -e "Creating link for ${green}$dir${nc} @ ${red}$XDG_CONFIG_HOME/${green}$dir${nc}"
                    ln -s "$SCRIPT_DIR/dotfiles/$dir" "$XDG_CONFIG_HOME"
                fi
            fi
        fi
    done
fi
echo '>---------------------------------'

echo 'Initialising and updating submodules'
git submodule init
git submodule update

if !command -v pokemon-colorscripts >/dev/null 2>&1; then
    echo '>---------------------------------'

    # Subshell process to install pokemon-colorscripts
    echo 'Installing pokemon-colorscripts'
    (
        cd submodules/pokemon-colorscripts
        sudo ./install.sh
        exit 3
    )
fi
