# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
source <(kubectl completion bash)
source <(helm completion bash)
source <(kubectl-argo-rollouts completion bash)
source /root/kube-ps1.sh
export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_CONTEXT_ENABLE=false
export KUBE_PS1_PREFIX=''
export KUBE_PS1_SUFFIX=''
#PS1='[\u@\h \W $(kube_ps1)]\$ '
#PS1='[$USER@$HOSTNAME:$PWD $(kube_ps1)]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function git_branch {
    branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
    if [ "${branch}" != "" ];then
        if [ "${branch}" = "(no branch)" ];then
            branch="(`git rev-parse --short HEAD`...)"
        fi
        echo " ($branch)"
    fi
}

# golang
alias golang='cd /data/go/src'
export GO111MODULE=on
export GOPROXY=https://goproxy.io
export GOPATH=/data/go

export PATH=$PATH:/usr/local/go/bin
export PS1='[$USER@$HOSTNAME:$PWD $(kube_ps1) $(git_branch)]\$ '