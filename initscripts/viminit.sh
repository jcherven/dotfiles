#!/bin/bash

set -e

NVIMPLUG="$HOME/.config/nvim/autoload/plug.vim"
NVIMINIT="$HOME/.config/nvim/init.vim"
VIMPLUG="$HOME/.vim/autoload/plug.vim"
MYVIMRC="$HOME/.vimrc"
PLUGURL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

if [[ -x "$(command -v nvim)" ]]
then
  echo
  echo "Fetching and installing vim-plug for Neovim"
  curl -fLo "$NVIMPLUG" --create-dirs "$PLUGURL"
  if [[ ! -e "$NVIMINIT" ]]; then
    ln -s "$HOME/dotfiles/config/nvim/init.vim" "$NVIMINIT"
  fi
  echo "Fetching and installing Neovim plugins"
  nvim --headless +PlugInstall +qa && echo "vim-plug for Neovim configured."
fi

if [[ -x "$(command -v vim)" ]]
then
  echo
  echo "Fetching vim-plug for Vim"
  curl -fLo "$VIMPLUG" --create-dirs "$PLUGURL"
  if [[ ! -e "$MYVIMRC" ]]; then
    ln -s "$HOME/dotfiles/config/nvim/init.vim" "$MYVIMRC"
  fi
  echo "Fetching and installing Vim plugins"
  vim -c 'PlugInstall | qa' && echo "vim-plug for Vim configured."
fi

