# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

alias ll='ls -lF'
alias lt='ll -t'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias up='cd ..'
alias myprocs='ps aux | grep $USER'

export IRCNICK=tomkralidis
export IRCNAME="Tom Kralidis"
export IRCSERVER=irc.freenode.net

export SVN_EDITOR=/bin/vi

export LD_LIBRARY_PATH=/home/$USER/lib
export PATH=$PATH:/home/$USER/bin
