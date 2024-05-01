#!/bin/bash

# ------------------------- EXPORTS ------------------------
# User related
export USER="${USER:-$(whoami)}"
export GITUSER="$USER"
export TZ=Europe/Paris
export GHREPOS="$REPOS/github.com/$GITUSER"

# Directories related
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export MUSIC="$HOME/Music"
export PICTURES="$HOME/Pictures"
export REPOS="$HOME/Repos"
export SCRIPTS="$HOME/Scripts"
export VIDEOS="$HOME/Videos"

# History
export HISTCONTROL=erasedups:ignorespace
export HISTFILESIZE=10000
export HISTSIZE=500

#------------------------------- FUNCTIONS ---------------------

_is_installed() { type "$1" &>/dev/null; }

clone() {
	local repo="$1" user
	local repo="${repo#https://github.com/}"
	local repo="${repo#git@github.com:}"
	if [[ $repo =~ / ]]; then
		user="${repo%%/*}"
	else
		user="$GITUSER"
		[[ -z "$user" ]] && user="$USER"
	fi
	local name="${repo##*/}"
	local userd="$REPOS/github.com/$user"
	local path="$userd/$name"
	[[ -d "$path" ]] && cd "$path" && return
	mkdir -p "$userd"
	cd "$userd"
	echo gh repo clone "$user/$name" -- --recurse-submodule
	gh repo clone "$user/$name" -- --recurse-submodule
	cd "$name"
} && export -f clone

# ------------------------------ ALIASES -----------------------------
alias ls='ls -h --color=auto'
alias free='free -h'
alias tree='tree -a'
alias df='df -h'
alias chmox='chmod +x'
alias more="less"
_is_installed vim && alias vi=vim
_is_installed nvim && alias vim=nvim

# ------------------------- NVM ------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
