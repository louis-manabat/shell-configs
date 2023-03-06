#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8
#
# Modular script to check package/plugins if they exist or at a reasonable version level

retval=0

if [ ! -d "$1" ]; then
	printf "Powerlevel10K is not installed. Please install Powerlevel10k below:\\
			Repository link: https://github.com/romkatv/powerlevel10k" >/dev/null 2>&1
	retval=1
else
	printf 'Powerlevel10k is installed' >/dev/null 2>&1
	retval=0
fi

exit $retval
