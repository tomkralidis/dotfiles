# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# figure out OS
if [ `uname -s` == 'MINGW32_NT-10.0' ]; then
    export USER=$USERNAME
    alias more='less'
elif [ `uname -s` == 'Darwin' ]; then
    if [ -f ~/.git-completion.bash ]; then
        source ~/.git-completion.bash
    fi
fi

# User specific environment and startup programs

# aliases
alias ll='ls -lF'
alias dir='ll'
alias lt='ll -t'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias up='cd ..'
alias myprocs='ps aux | grep $USER'
alias howlong='ps -eo pid,etime,command|grep $@'
alias numcores='cat /proc/cpuinfo | grep processor | wc -l'
alias pine='alpine'
alias pywebserver='python -mSimpleHTTPServer'
function fact() {
    curl -s http://randomfunfacts.com  | grep "<strong>"|sed 's#<td bordercolor="\#FFFFFF"><font face="Verdana" size="4"><strong><i>##'|sed 's#</i></strong></font>&nbsp;</td>##'
}

# functions (which are too complex for simple aliases)

function unixtime2iso8601() {
    # convert unix timestamp to ISO 8601 datetime
    python -c "import datetime;print(datetime.datetime.fromtimestamp(int("$@")).strftime('%Y-%m-%dT%H:%M:%SZ'))"
}

# environment variables
export IRCNICK=tomkralidis
export IRCNAME="Tom Kralidis"
export IRCSERVER=irc.freenode.net
export SVN_EDITOR=/bin/vi
export LD_LIBRARY_PATH=$HOME/lib
export PATH=$PATH:$HOME/bin
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
