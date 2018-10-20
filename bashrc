# source .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias vi=vim
alias ll="ls -l"
alias la="ll -a"

ssh_tunnel()
{
    port=$1
	s=$(lsof -Pnl +M -i4 | awk '$9 ~ /'$port'/ {print $2;exit;}');
    echo $s
	kill -9 ${s%/*} &> /dev/null;
    shift;
    if [ $1 == "start" ]; then
        shift;
	    ssh -g -N -f -C -L $port:localhost:$*;
    else
        ssh $*
    fi
}

scp_to_bitest()
{
	scp ${@:1:$(($#-1))} wangqy@192.168.10.137:${@: -1}
}

scp_from_bitest()
{
	scp ${@:1:$(($#-2))} wangqy@192.168.10.137:${@: -2}
}

scp_to_bwg()
{
	scp -P 29387 ${@:1:$(($#-1))} dashu@93.179.100.207:${@: -1}
}
alias fbit=scp_from_bitest
alias tbit=scp_to_bitest
alias tbwg=scp_to_bwg
alias stht="ssh_tunnel 7080 -g -N -f -C -D 7080 user@host -p port"
alias sthdbt="ssh_tunnel 3307 -g -N -f -C -L 3307:somehost:3306 user@sth -p port"
alias sthdb="mysql -h 127.0.0.1 -P 3307 -D DB -u DBUSER -p -A"

alias 2bit="ssh bi-test"
alias 2bwg="ssh bwg"
alias 2big="ssh bi-gate"

export PYTHONPATH=/Users/u/forest/caffe/python:$PYTHONPATH
export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/lib:/usr/lib:/usr/lib/python2.7
export STK_LOAD_PATH=/Users/u/forest/scheme

export PATH=/usr/local/share/apache-maven-3.5.0/bin:$PATH
export PATH=/Users/u/Library/Python/2.7/bin:$PATH
export PATH=/Users/u/forest/aws:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home/
