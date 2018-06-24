#!/bin/sh

for i in $(cat files.txt); do
    if [ ! -f ../$i ] && [ ! -d ../$i ]; then
        ln -s dotfiles/$i ../$i
    fi
done

