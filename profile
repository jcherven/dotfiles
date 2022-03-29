# .profile is used by sh, but bash will use it if .bash_profile or .bash_login doesn't exist. bash-specific stuff should go into .bash_profile

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# include Windows utilities if on WSL
if [ -d "/mnt/c/WINDOWS" ] ; then
  PATH="$PATH:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32" ;
elif [ -d "/windir/c/Windows" ] ; then
  PATH="$PATH:/windir/c/Windows:/windir/c/Windows/System32" ;
fi

export QT_QPA_PLATFORMTHEME=gtk2

# MacPorts Installer addition on 2021-03-05_at_11:59:15: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
