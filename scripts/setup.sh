#!/bin/bash

# Directory where this script is located
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Function to read links from file and make them
mkLinks () {
    for i in $(cat $DIR/$1)
    do
        lnArgs=(${i//,/ })
        ln -sri $DIR/../configs/${lnArgs[0]} "${lnArgs[1]/#\~/$HOME}"
    done
}

# Main
read -p "Do you currently have zsh or would like to install it (y/n)? " doZsh

if [ $doZsh = "y" ] || [ $doZsh = "Y" ]
then
    if [[ "$(command -v zsh)" ]]
    then
        :
    else
        echo Installing zsh...
        sudo apt-get install zsh
    fi
    mkLinks zsh.txt
else
    mkLinks bash.txt
fi
