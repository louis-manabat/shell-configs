#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8
#
# Downloads necessary packages for setup

manual=$1
rpi=$2
nonquiet_installation=$3
assume_yes=""
quiet=""

packages=("python3-pip", "python3")
if [ "$manual" = false ]; then
    assume_yes="-y"
fi

if [ "$nonquiet_installation" = false ]; then
    quiet="-q"
fi

echo '***************************************'
echo '| Installing packages                 |'
echo '***************************************'
for package in ${packages[@]}; do
    echo "- Installing $package pacakge"
    sudo apt install $package $assume_yes $quiet
done


if [ "$rpi" = true ]; then
    echo 'Installing relevant Raspberry Pi packages'
fi