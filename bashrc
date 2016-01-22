# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


################################################################################
#			LWT
# colours!
BLACK="\[\e[0;30m"
BLUE="\[\e[0;34m"
GREEN="\[\e[0;32m"
CYAN="\[\e[0;36m"
RED="\[\e[0;31m"
PURPLE="\[\e[0;35m"
BROWN="\[\e[0;33m"
LIGHT_GRAY="\[\e[0;37m"
DARK_GRAY="\[\e[1;30m"
LIGHT_BLUE="\[\e[1;34m"
LIGHT_GREEN="\[\e[1;32m"
LIGHT_CYAN="\[\e[1;36m"
LIGHT_RED="\[\e[1;31m"
LIGHT_PURPLE="\[\e[1;35m"
YELLOW="\[\e[1;33m"
WHITE="\[\e[1;37m"
DEFAULT="\[\e[0;39m"


set -o vim  # vim style editing of command line

################################################################################
## You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto -F'
export TERM=xterm-256color
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
PS1="\r\n${GREEN}\]# ${YELLOW}\]\u@\h ${LIGHT_BLUE}\]\w\r\n${GREEN}\]#${DEFAULT}\] ";        export PS1
PATH="$PATH:$HOME/.bin"; export PATH

# eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias lh='ls $LS_OPTIONS *.h'
alias lc='ls $LS_OPTIONS *.cpp *.c'
alias vless='/usr/share/vim/vim74/macros/less.sh'
alias svds='svn diff --diff-cmd $HOME/bin/svnvimdiff'
alias svdb='svn diff --diff-cmd $HOME/bin/bcdiff.sh'
alias svd='svn diff|vless'
alias pyc='rm *.pyc *.log core*'
alias valgrind='valgrind --tool=memcheck --leak-check=yes -v'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias vim='vim -X -p '
alias gvim='gvim -p '
alias mount='sudo mount'
alias umount='sudo umount'
alias grepy='find . -name "*.py" |xargs grep --color=auto $*'
alias grepjs='find . -name "*.js" |xargs grep --color=auto $*'
alias test_migrate='JUMP_DB_NAME=test_nectar python manage.py migrate'
alias print_colors='for ((color = 0; color <= 255; color++)); do tput setaf "$color"; printf "$color test\n"; done'

