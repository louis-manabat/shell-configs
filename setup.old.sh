#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8
#
# Copies selected files into its respective locations - overriding the local file that exists on the system

ZSH_ARG=${1:-~/.zshrc}
P10K_ARG=${2:-~/.p10k.zsh}

checkZSHVer=$(./setup-functions/checkZSHVersion.sh)
checkP10KVer=$(./setup-functions/checkP10KVersion.sh "$P10K_ARG")

echo '----------------------------------'
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
echo '----------------------------------'

# Copies .zshrc file from local repo to .zshrc location (default ~./zshrc)
if [ -f $ZSH_ARG ]; then
	echo ".zshrc exists, copying frpm local repo"
	cp ./dotfiles/zsh/.zshrc $ZSH_ARG
else
	echo ".zshrc doesn't exist. Copying from local repo"
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

# Copy plugins directory into zsh/plugins in root
if [ ! -d "$HOME/.zsh" ]; then
    mkdir "$HOME/.zsh"
fi

if [ ! -d "$HOME/.zsh/plugins" ]; then
    mkdir "$HOME/.zsh/plugins"
fi

if [ -d "$HOME/.zsh/plugins/fzf-tab" ]; then
	rm -rf ~/.zsh/plugins/fzf-tab
fi

cp -R dotfiles/zsh/plugins/fzf-tab ~/.zsh/plugins/fzf-tab

# Prompt to apply the .zshrc and .p10k.zsh changes if desired
while true; do
	echo -n "Do you want to apply changes to .zshrc and .p10k.zsh? (y/n)? "
	read yn

	case $yn in
	[yY])
		echo "Applying changes"
		source $ZSH_ARG
		break
		;;
	[nN])
		echo "Changes will not be applied, please run following manually to apply changes:\n
				source ~/.zshrc"
		break
		;;
	*) echo "Invalid response" ;;
	esac

done

# Git config commands
cp ./dotfiles/git/config ~/.gitconfig