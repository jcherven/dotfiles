#!/bin/bash
#
if [ -f $HOME/dotfiles/bashrc ]; then
  source "$HOME/dotfiles/bashrc"
fi

if [ ! -f $HOME/.tmux.conf ]; then
  ln -s "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
fi

if [ ! -f $HOME/.Xresources ]; then
  ln -s "$HOME/dotfiles/Xresources" "$HOME/.Xresources"
fi

if [ ! -f $HOME/.inputrc ]; then
  ln -s "$HOME/dotfiles/inputrc" "$HOME/.inputrc"
fi

if [ ! -f $HOME/.vimrc ]; then
  ln -s "$HOME/dotfiles/config/nvim/init.vim" "$HOME/.vimrc"
fi

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -e /Users/jums/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jums/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(pyenv init -)"
