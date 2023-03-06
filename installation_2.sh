#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8

echo '>--------------------------'
echo '> Installing Python3 & Pip3'
echo '>--------------------------'
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip

echo '>--------------------------'
echo '> Installing Docker-Compose'
echo '>--------------------------'
sudo pip3 install docker-compose

echo 'Enabling Docker on boot'
sudo systemctl enable docker