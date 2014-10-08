#!/bin/bash

set -e

mkdir -p ~/.vim/bundle
rm -rf $HOME/.vim/bundle/Vundle.vim /tmp/Vundle.old || true
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#echo -n "Loading plugins using Vundle... "
echo "Run \"vim +PluginInstall +qall\" from an interactive terminal now or when using vim first time"
#echo "Done"
