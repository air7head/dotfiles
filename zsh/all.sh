#!/bin/bash

set -e
cd "$(dirname "$0")"

echo "ZSH setup"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "   Installing Oh My ZShell!"
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

echo "Adding custom setup to oh-my-zsh"
rm -rf $HOME/.oh-my-zsh/custom 
BASEPATH="`pwd`"
ln -s $BASEPATH/oh-my-zsh/custom.symlink $HOME/.oh-my-zsh/custom

echo "   ZSH version: $(zsh --version)"
echo "   To change default shell to ZSH run: chsh -s $(command -v zsh)"
