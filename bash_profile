#! /usr/bin/env bash
# .bash_profile is for non-interactive shells. Only configs for shells launched by other programs should go in here.
# .bashrc, which is for interactive shells, will be invoked here.

# adds necessary environment variables for nix
# . /Users/choro/.nix-profile/etc/profile.d/nix.sh

# MacPorts Installer addition on 2021-03-05_at_11:59:15: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Add the dotfiles bash_scripts directory to $PATH
# export PATH="$PATH:$HOME/dotfiles/bash_scripts"

export PATH="$PATH:$HOME/.local/bin:/windir/c/WINDOWS:/windir/c/Windows/System32/"

# Use the homebrew installed jdk. needs to be updated for the macports version
# if [[ "$OSTYPE" == "darwin"* ]]; then
# 	export PATH="/usr/local/opt/java/bin:$PATH"
# 	export JAVA_HOME=`/usr/libexec/java_home`
# fi

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
# keychain ~/.ssh/id_github_choro-artichoke-wsl
# . ~/.keychain/${HOSTNAME}-sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -f "$HOME/dotfiles/bashrc" ]] && source "$HOME/dotfiles/bashrc"

# ex: set foldmethod=marker:
