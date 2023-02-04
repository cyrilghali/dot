# Requirements:
# ripgrep
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

export CLICOLOR=1
export LANG="en_US.UTF-8"

function zet {
    zetdir=$(date -u +%Y%m%d%H%M%S)
    mkdir -p $zetdir
    vim $zetdir/README.md
}

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias up="cd .. &amp;&amp; ls --color"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -alh"
alias mkdir='mkdir -p'

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR="vim"
