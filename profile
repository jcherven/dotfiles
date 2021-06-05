# .profile is used by sh, but bash will use it if .bash_profile or .bash_login doesn't exist. bash-specific stuff should go into .bash_profile

# adds necessary environment variables for nix
# . /Users/choro/.nix-profile/etc/profile.d/nix.sh

# MacPorts Installer addition on 2021-03-05_at_11:59:15: adding an appropriate PATH variable for use with MacPorts.
export PATH="`brew --prefix`/bin:/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# for the macports-provided nvm
source /opt/local/share/nvm/init-nvm.sh

# export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

