#! /usr/bin/env bash
# .bash_profile is for non-interactive shells. Only configs for shells launched by other programs should go in here.
# .bashrc, which is for interactive shells, will be invoked here.

# Add the dotfiles bash_scripts directory to $PATH
# export PATH="$PATH:$HOME/dotfiles/bash_scripts"

export PATH="$PATH:$HOME/.local/bin:/windir/c/WINDOWS:/windir/c/Windows/System32/:/windir/c/Users/jcherven/bin/"

# Editor preference is for vi-likes
if [ -x "$(command -v nvim)" ]; then
  export EDITOR=nvim
elif [ -x "$(command -v vim)" ]; then
  export EDITOR=vim
elif [ -x "$(command -v vi)" ]; then
  export EDITOR=vi
# otherwise use whatever is set by the system
fi

# enable keychain for ssh on machines with it installed
source "$HOME/dotfiles_env"
# keychain ~/.ssh/{id_jcherven,id_cherven.james@icloud.com@work}
# . ~/.keychain/${HOSTNAME}-sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -f "$HOME/dotfiles/bashrc" ]] && source "$HOME/dotfiles/bashrc"

# ex: set foldmethod=marker:
