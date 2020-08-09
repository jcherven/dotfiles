#!/bin/bash

if [ -f $HOME/dotfiles/bashrc ] && [ ! -f $HOME/.bashrc ]; then
  source "$HOME/dotfiles/bashrc"
fi

if [ -f $HOME/dotfiles/bash_aliases ] && [ ! -f $HOME/.bash_aliases ]; then
  source "$HOME/dotfiles/bash_aliases"
fi

# if [ -d $HOME/dotfiles/scripts ] && [ ! -d $HOME/.scripts ]; then
#   ln -s "$HOME/dotfiles/scripts $HOME/.scripts"
# fi

if [ -f $HOME/dotfiles/tmux.conf ] && [ ! -f $HOME/.tmux.conf ]; then
  ln -s "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
fi

if [ -f $HOME/dotfiles/inputrc ] && [ ! -f $HOME/.inputrc ]; then
  ln -s "$HOME/dotfiles/inputrc" "$HOME/.inputrc"
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [ -x "$(command -v Xorg)" ] && [ ! -f $HOME/.Xresources ]; then
    ln -s "$HOME/dotfiles/Xresources" "$HOME/.Xresources"
  fi
fi

# if [ ! -f $HOME/.vimrc ]; then
#   ln -s "$HOME/dotfiles/config/nvim/init.vim" "$HOME/.vimrc"
# fi

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# if [ -e /Users/jums/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jums/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# eval "$(pyenv init -)"
