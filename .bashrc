# SOURCE
if type fzf &> /dev/null; then
  [ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash
fi
# ripgrep
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

if type bat &> /dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi



# FUNCTIONS
function zet {
    zetdir=$(date -u +%Y%m%d%H%M%S)
    mkdir -p $zetdir
    vim $zetdir/README.md
}


# ALIASES
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias up="cd .. &amp;&amp; ls --color"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -alh"
alias mkdir='mkdir -p'

# EXPORTS
export CLICOLOR=1
export LANG="en_US.UTF-8"
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR="vim"
