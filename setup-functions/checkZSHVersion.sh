#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8
#
# Modular script to check package/plugins if they exist or at a reasonable version level

retval=0

if [[ "$ZSH_VERSION" -ge 5.8 ]]; then
	printf "ZSH Version is greater than $ZSH_VERSION" >/dev/null 2>&1
	retval=0
elif [[ "$ZSH_VERSION" -le 5.8 ]]; then
	printf "ZSH Version is not greater then $ZSH_VERSION. Please update ZSH" >/dev/null 2>&1
	retval=1
elif [[ -z "$ZSH_VERSION" ]]; then
	printf "ZSH does not exist. Please install the latest ZSH Version (5.8)" >/dev/null 2>&1
	retval=1
else
	printf 'Unknown error :)' >/dev/null 2>&1
	retval=1
fi

exit $retval
