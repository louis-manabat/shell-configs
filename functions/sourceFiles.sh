#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8
#
# To loop over all the alias files in the aliases directory and source them as alias commands

for f in ~/.aliases/*
do
    echo "File: $f"

    # Ensuring the shell script has the correct 
    chmod +x $f

    # Sourcing the alias file to make the commands runnable
    source $f
done