#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8

echo '*******************'
echo '| Updating distro |'
echo '*******************'
sudo apt update -y
sudo apt upgrade -y

echo '***********************'
echo '| Installing packages |'
echo '***********************'

echo '>------------------'
echo '> Installing '
echo '>------------------'

echo '>------------------'
echo '> Installing Docker'
echo '>------------------'
curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker ${USER}

echo '>---------------'
echo '> Installing ZSH'
echo '>---------------'

echo '>--------------------------------'
echo '> Installing pokemon-colorscripts'
echo '>--------------------------------'
git submodule update --remote --merge
sudo ./submodules/pokemon-colorscripts/install.sh