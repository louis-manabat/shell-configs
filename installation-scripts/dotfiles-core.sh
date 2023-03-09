#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8

manual=false
assume_yes=""
quiet_level=0
quiet=""

P10K_ARG=${1:-~/.p10k.zsh}

checkZSHVer=$(./../setup-functions/checkZSHVersion.sh)
checkP10KVer=$(./../setup-functions/checkP10KVersion.sh "$P10K_ARG")

echo '>---------------------------------'
if [[ $checkZSHVer -ne 0 ]]; then
	echo 'ZSH error'
	exit 1
else
	echo 'ZSH is installed'
fi

if [[ $checkP10KVer -ne 0 ]]; then
	echo 'P10K error'
	exit 1
else
	echo 'Powerlevel10K is installed'
fi

while [ $# -gt 0 ]; do
    case "$1" in
    -m | --manual)
        manual=true
        ;;
    -q | --quiet)
        if [ $quiet_level -gt 0 ]; then
            echo "Error: Cannot use both -q and -qq flags." >&2
            exit 1
        fi
        echo 'Setting quiet level to minimum'
        quiet_level=1
        ;;
    -qq | --qquiet)
        if [ $quiet_level -gt 0 ]; then
            echo "Error: Cannot use both -q and -qq flags." >&2
            exit 1
        fi
        echo 'Setting quiet level to maximum'
        quiet_level=2
        ;;
    -h | --help) ;;
    *)
        echo "Invalid flag: $1" >&2
        exit 1
        ;;
    esac
    shift
done

if ! $manual; then
    assume_yes="-y"
fi

if [ $quiet_level -eq 0 ]; then
    quiet=""
elif [ $quiet_level -eq 1 ]; then
    quiet="-q"
elif [ $quiet_level -eq 2 ]; then
    quiet="-qq"
else
    echo 'What in the error happened???'
fi

echo '>---------------------------------'
echo '> Getting updates'
sudo apt-get update $assume_yes $quiet
echo '> Applying updates'
sudo apt-get upgrade $assume_yes $quiet
echo '> Removing unused packages'
sudo apt-get autoremove $assume_yes $quiet


if ! command -v git >/dev/null 2>&1; then
    echo '>---------------------------------'
    echo '> Installing Git '
    sudo apt-get install git $assume_yes $quiet
fi

packages=()

while IFS= read -r package  || [ -n "$package" ]
do
    packages+=("$package")
done < dotfiles-core.txt

for package in "${packages[@]}"
do
    echo '>---------------------------------'
    echo "> Installing $package"
    sudo apt-get install $pacakge $assume_yes $quiet
done

echo '>---------------------------------'
echo '> Installing fzf '
if [ -f ~/.fzf.zsh ]; then

else

fi