#!/bin/bash

set -e

# Some setup of directories that will be used by dotfiles
# Listing of directories needed by dotfiles. Add new needed entries to this array.
DIRECTORIES=(
  # directories needed in ~/.config
  "$HOME/.config/nvim"
  "$HOME/.config/git"
  "$HOME/.config/alacritty"
  "$HOME/.bash_completion/alacritty"
  )

# Create directories defined in DIRECTORIES array. Requires /bin/bash for C-style looping to access array indexes
for ((j=0; j<${#DIRECTORIES[@]}; ++j)); do
  if [ ! -d "${DIRECTORIES[$j]}" ]; then
    mkdir -p "${DIRECTORIES[$j]}"
  fi
done

# Symlinked files
# Listing of symlinks for files that are located in ~/
FILESLOCAL=( # items correspond  to FILESLINKED by index order
  # Xorg configs
  "$HOME/.Xresources"
  # bash and other shell configs
  "$HOME/.bash_profile"
  "$HOME/.bashrc"
  "$HOME/.bash_completion/alacritty/alacritty.yml"
  "$HOME/.inputrc"
  # tmux
  "$HOME/.tmux.conf"
  # git global configs
  "$HOME/.config/git/config"
  "$HOME/.config/git/ignore"
  # other applications
  "$HOME/.config/alacritty/alacritty.yml"
)

FILESLINKED=(
  # Xorg configs
  "$HOME/dotfiles/Xresources"
  # bash and other shell configs
  "$HOME/dotfiles/bash_profile"
  "$HOME/dotfiles/bashrc"
  "$HOME/dotfiles/bash_completion/alacritty/alacritty.yml"
  "$HOME/dotfiles/inputrc"
  # tmux
  "$HOME/dotfiles/tmux.conf"
  # git global configs
  "$HOME/dotfiles/config/git/config"
  "$HOME/dotfiles/config/git/ignore"
  # other applications
  "$HOME/dotfiles/config/alacritty/alacritty.yml"
)

# Set the ~/ dot file symlinks defined in FILESLINKED {{{
# requires a c-style loop to access array index numbers
for ((i=0; i<${#FILESLOCAL[@]}; ++i)); do
  if [ -e "${FILESLOCAL[$i]}" ];
  then
    mv "${FILESLOCAL[$i]}" "${FILESLOCAL[$i]}.old.$(date %c)"
  fi
  ln -s "${FILESLINKED[$i]}" "${FILESLOCAL[$i]}"
done
# }}}

# Call software bootstrap install/config scripts {{{
# MacOS 13
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Install the OS's basic environment bootstrap apps (currently supports MacOS)
  source "$HOME/dotfiles/initscripts/swbootstrap.sh"
  # Set macos 13 system settings
  source "$HOME/dotfiles/initscripts/macosinit.sh"
fi
# Debian
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  source "$HOME/dotfiles/initscripts/debianinit.sh"
fi

#}}}

echo "initDotfiles.sh has completed."

# ex: set foldmethod=marker:
