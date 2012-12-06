#!/bin/bash

echo "uninstall vim configurations!"
echo "please input yes or no to continue:"
read ans
while [[ "$ans" != "yes" && "$ans" != "no" ]]
do
    echo "you must input yes or no to continue!"
    read ans
done

if [ "$ans" == "yes" ]; then
    cd ~

    rm -f .vimrc
    rm -f .gvimrc

    rm -rf .vim
else
    echo "exit,do nothing."
fi
