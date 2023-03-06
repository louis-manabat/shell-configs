#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8

echo '>--------------------------'
echo '> Installing Docker-Compose'
echo '>--------------------------'
sudo pip3 install docker-compose

echo 'Enabling Docker on boot'
sudo systemctl enable docker

if [ "$rpi" = true ]; then
    echo 'Installing relevant Raspberry Pi packages'
fi

echo '>--------------------------------'
echo '> Installing pokemon-colorscripts'
echo '>--------------------------------'
git submodule update --remote --merge
sudo ./submodules/pokemon-colorscripts/install.sh