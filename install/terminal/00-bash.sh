#! /bin/bash

echo "Install Bash stuff"

rm -f ${HOME}/.bash
rm -f ${HOME}/.bashrc
rm -f ${HOME}/.bash_aliases
rm -f ${HOME}/.profile

mystow bash

rm -f ${HOME}/.dir_colors
mystow dircolors
