#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8
#
# Copies selected files from the local system into the local repo to push back into remote

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

# Copies .zshrc file from root
if [ -f $ZSH_ARG ]; then
	echo ".zshrc exists, copying to local repo"
	cp ~/.zshrc ./zsh/.zshrc
else
	echo ".zshrc doesn't exist. Please install ZSH"
	exit 1
fi

# Copies .p10k.zsh file from root
if [ -f $P10K_ARG ]; then
	echo ".p10k.zsh exists, copying to local repo"
	cp ~/.p10k.zsh ./zsh/.p10k.zsh
else
	echo ".p10k.zsh doesn't exist. Please install P10K"
	exit 1
fi

# Copies the aliases directory from root into repo
rm -rf .aliases
cp -R aliases ~/.aliases