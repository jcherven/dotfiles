if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -e /Users/jums/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jums/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
