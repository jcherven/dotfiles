#! /usr/bin/env bash
# .bashrc is for interactive shells. Only configs for commands you will type yourself should go in here.
# The configuration here has been written as if this file will be sourced by .bash_profile.

# disables the annoying zsh notification in Catalina
# if you put this in /etc/profile then this can be commented out.
# export BASH_SILENCE_DEPRECATION_WARNING=1

# Prompt configuration {{{
# Git prompt script needs to be manually updated every so often from https://github.com/git/git/tree/contrib/completion
GITPROMPT="$HOME/dotfiles/bash_scripts/git-prompt.sh"
if [ -f  "$GITPROMPT" ]; then
  source "$GITPROMPT"
  export GIT_PS1_SHOWDIRTYSTATE=1
  # NORMALBLACK="\[\033[0;30m\]"
  NORMALRED="\[\033[0;31m\]"
  # NORMALGREEN="\[\033[0;32m\]"
  # NORMALYELLOW="\[\033[0;33m\]"
  NORMALBLUE="\[\033[0;34m\]"
  NORMALMAGENTA="\[\033[0;35m\]"
  # NORMALCYAN="\[\033[0;36m\]"
  # NORMALWHITE="\[\033[0;37m\]"
  #
  # BRIGHTBLACK="\[\033[1;30m\]"
  # BRIGHTRED="\[\033[1;31m\]"
  # BRIGHTGREEN="\[\033[1;32m\]"
  # BRIGHTYELLOW="\[\033[1;33m\]"
  # BRIGHTBLUE="\[\033[1;34m\]"
  # BRIGHTMAGENTA="\[\033[1;35m\]"
  # BRIGHTCYAN="\[\033[1;36m\]"
  # BRIGHTWHITE="\[\033[1;37m\]"

  RESETCOLOR="\[\033[0m\]"
  export PS1="$NORMALBLUE\u $NORMALMAGENTA\W$NORMALRED\$(__git_ps1)$RESETCOLOR \$ "
fi
# }}}

# Needed to make FreeBSD ls and less look nice
# closest equivalent to eval "($dircolors)" in GNU
export CLICOLOR=YES

# Highlighted man page output in linux and macos {{{
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man $@
}
# }}}

# Custom less. All options work and are GNU and FreeBSD less compatible.
# https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --no-init --window=-8'

# for bash_completion installed by macports
[[ -f "/opt/local/etc/profile.d/bash_completion.sh" ]] && source "/opt/local/etc/profile.d/bash_completion.sh"

# bash_completion for nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Git completion for branch names, subcommands, and more
GITCOMPLETION="$HOME/dotfiles/bash_scripts/git-completion.bash"
[[ -f "$GITCOMPLETION" ]] && source "$GITCOMPLETION"

# ALIASES {{{
# makes FreeBSD ls work the way i want it to
# https://www.topbug.net/blog/2016/11/28/a-better-ls-command/
# GNU ls closest equivalent is:
# ls -F -h --color=always --group-directories-first -v
alias ls='ls -G -F -h'

# ts to print the current time
alias ts="date +%H:%M"

# ds to print the current date
alias ds="date +%Y-%m-%d"

# Make tmux assume that the outside terminal supports 256-color
# alias tmux="tmux -2"
# }}}

# ex: set foldmethod=marker:
