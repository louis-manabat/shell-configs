#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8
#
# Copies selected files into its respective locations - overriding the local file that exists on the system

checkZSHVer=$(./functions/checkZSHVersion.sh)
checkP10KVer=$(./functions/checkP10KVersion.sh)

if [[ $checkZSHVer -ne 0 ]]; then
	exit 1
else
	if [[ $checkP10KVer -ne 0 ]]; then
		exit 1
	fi
fi

ZSH_ARG=${1:-~/.zshrc}
P10K_ARG=${2:-~/.p10k.zsh}

# Copies .zshrc file from local repo to .zshrc location (default ~./zshrc)
if [ -f $ZSH_ARG ]; then
	echo ".zshrc exists, copying frpm local repo"
	cp ./dotfiles/zsh/.zshrc $ZSH_ARG
else
	echo ".zshrc doesn't exist. Copying frpm local repo"
	cp ./dotfiles/zsh/.zshrc $ZSH_ARG
fi

# Copies .p10k.zsh file from local repo to .zshrc location (default ~./zshrc)
if [ -f $P10K_ARG ]; then
	echo ".p10k.zsh exists, copying from local repo"
	cp ./dotfiles/zsh/.p10k.zsh $P10K_ARG
else
	echo ".p10k.zsh doesn't exist. Copying frpm local repo"
	cp ./dotfiles/zsh/.p10k.zsh $P10K_ARG
fi

# Copies the aliases directory into root
rm -rf ~/.aliases
cp -R aliases ~/.aliases

# Prompt to apply the .zshrc and .p10k.zsh changes if desired
while true; do
	echo -n "Do you want to apply changes to .zshrc and .p10k.zsh? (y/n)? "
	read yn

	case $yn in
	[yY])
		echo "Applying changes"
		source $ZSH_ARG
		source $P10K_ARG
		break
		;;
	[nN])
		echo "Changes will not be applied, please run following manually to apply changes:\n
				source ~/.zshrc\n
				source ~/.p10k.zsh"
		break
		;;
	*) echo "Invalid response" ;;
	esac

done

# Git config commands
cp ./dotfiles/git/config ~/.gitconfig