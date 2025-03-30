#!/usr/bin/env bash

# Navigation
alias ..="cd ./../"
alias .2="cd ./../../"
alias .3="cd ./../../../"
alias .4="cd ./../../../../"
alias .5="cd ./../../../../../"

# File management
alias mv="mv -vi"
alias cp="cp -vi"
alias cpv="rsync -avh --info progress2" # verbose
alias rm="rm -vi"
alias ln="ln -i"
alias mkdir="mkdir -pv"
alias ls="ls -CF --color=auto"
alias la="ls -A"
alias ll='ls -l'
alias lnc="ls --color=no"
alias lcount="ls * | wc -l"

# Python
alias py="python3"
alias python="python3"

# Neovim
alias vim="nvim"
alias vi="nvim"

# Git/GitHub
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit"
alias gch="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gd="git diff"
alias gs="git status"
alias gl="git log"
alias gll="git log --oneline"
alias gp="git pull"
alias gpsh="git push"

function gcl() {
    local repo="$1"
    local dest="${2:-$(basename "$repo")}"
    git clone "https://github.com/$repo" "$dest" "${@:3}"
}

# Sourcing
alias srct="tmux source $HOME/.config/tmux/tmux.conf"
alias srcb="source $HOME/.bashrc"

# Misc
alias 2cb="xclip -selection clipboard"
alias vsc="'/mnt/c/Users/darra/AppData/Local/Programs/Microsoft VS Code Insiders/bin/code-insiders'"
alias notes="nvim $HOME/.notes.txt"
alias confget="config get"
alias path="echo -e ${PATH//:/\\n} | less"
alias brc="nvim $HOME/.bashrc"
alias suvi="sudo nvim"
