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
    if [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]; then
        source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
    elif [ -f ~/.git-completion.bash ]; then
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

# convert unix timestamp to ISO 8601 datetime
function unixtime2iso8601() {
    python -c "import datetime;print(datetime.datetime.fromtimestamp(int("$@")).strftime('%Y-%m-%dT%H:%M:%SZ'))"
}

# determine how long a pid has been running for
function howlong() {
    ps -o etime= -p "$@"
}

# environment variables
export IRCNICK=tomkralidis
export IRCNAME="Tom Kralidis"
export IRCSERVER=irc.freenode.net
export SVN_EDITOR=/bin/vi
export LD_LIBRARY_PATH=$HOME/lib
export PATH=$PATH:$HOME/bin
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
# export PATH
