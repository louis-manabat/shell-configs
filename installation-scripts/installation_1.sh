#!/usr/bin/zsh
#
# ZSH Version script was created on = ZSH 5.8

rpi=false
manual=false
assume_yes=""
quiet_level=0
quiet=""
packages=("libffi-dev" "libssl-dev" "python3" "python3-pip" "python3-dev")

while [ $# -gt 0 ]; do
    case "$1" in
        -r|--rpi)
            rpi=true
            ;;
        -m|--manual)
            manual=true
            ;;
        -q|--quiet)
            if [ $quiet_level -gt 0 ]; then
                echo "Error: Cannot use both -q and -qq flags." >&2
                exit 1
            fi
            quiet_level=1
            ;;
        -qq|--qquiet)
            if [ $quiet_level -gt 0 ]; then
                echo "Error: Cannot use both -q and -qq flags." >&2
                exit 1
            fi
            quiet_level=2
            ;;
        -h|--help)
            ;;
        *)
            echo "Invalid flag: $1" >&2
            exit 1
            ;;
    esac
    shift
done

if ! $manual; then
    assume_yes="-y"
fi

if [ $quiet_level -eq 0 ]; then
    quiet=""
elif [ $quiet_level -eq 1 ]; then
    quiet="-q"
elif [ $quiet_level -eq 2 ]; then
    quiet="-qq"
else
    echo 'What in the error happened???'
fi

echo '*******************'
echo '| Updating distro |'
echo '*******************'
sudo apt update $assume_yes $quiet
sudo apt upgrade $assume_yes $quiet

echo '***********************'
echo '| Installing packages |'
echo '***********************'
for package in ${packages[@]}; do
    echo '------------------------------------------------'
    echo "> Installing \"$package\" pacakge"
    sudo apt install $package -y $quiet
done
echo '------------------------------------------------'

echo '>------------------'
echo '> Installing Docker'
echo '>------------------'
curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker ${USER}

echo '>---------------'
echo '> Installing ZSH'
echo '>---------------'

