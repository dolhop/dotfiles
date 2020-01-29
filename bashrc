# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth


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


set -o vi  # vim style editing of command line

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
alias vless='/usr/share/vim/vim80/macros/less.sh'
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
alias grepy='find . -name "*.py" |xargs grep -n --color=auto $* 2>/dev/null'
alias grepjs='find . -name "*.js" |xargs grep -n --color=auto $* 2>/dev/null'
alias grepch='find . -name "*.cpp" -o -name "*.c" -o -name "*.h" |xargs grep -n --color=auto $* 2>/dev/null'
alias greph='find . -name "*.h" |xargs grep -n --color=auto $* 2>/dev/null'
alias grepc='find . -name "*.cpp" -o -name "*.c"  |xargs grep -n --color=auto $* 2>/dev/null'
alias print_colors='for ((color = 0; color <= 255; color++)); do tput setaf "$color"; printf "$color test\n"; done'
alias svnst='svn st |grep -v external |grep -v "^\s*X" |grep -v "^\s*$"'
alias lg='git log --all --decorate --oneline --graph'
alias gsmu='git submodule update --recursive --remote'
alias svnclean='svn status --no-ignore | grep '^[I?]' | cut -c 9- | while IFS= read -r f; do rm -rf "$f"; done'
alias youtube-audio='youtube-dl --add-metadata --restrict-filenames --ignore-errors --extract-audio --audio-quality 0 --audio-format mp3 -o "%(track)s__%(artist)s.%(ext)s"'
alias ya='youtube-dl --add-metadata --restrict-filenames --ignore-errors --extract-audio --audio-quality 0 --audio-format mp3 -o "%(track)s__%(artist)s.%(ext)s"'


export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh
