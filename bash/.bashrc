#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[5 q\]${debian_chroot:+($debian_chroot)}'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

##############################

f_gry="\e[30m"
f_red="\e[31m"
f_grn="\e[32m"
f_ylw="\e[33m"
f_blu="\e[34m"
f_mag="\e[35m"
f_cyn="\e[36m"
f_wht="\e[37m"

f_lgry="\e[90m"
f_lred="\e[91m"
f_lgrn="\e[92m"
f_lylw="\e[93m"
f_lblu="\e[94m"
f_lmag="\e[95m"
f_lcyn="\e[96m"
f_lwht="\e[97m"

f_res="\e[39m"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
else
    echo -e "${f_red}Missing ~/.bash_aliases${f_res}"
fi

PROMPT_COMMAND=__prompt_cmd

__prompt_cmd() {
    local EXIT="$?"

    PS1="\e[5 q" # Reset cursor style to vertical bar
    PS1+="${debian_chroot:+($debian_chroot)}"

    if [ $EXIT != 0 ]; then
        PS1+="($f_red$EXIT$f_res) $PS1"
    fi

    PS1+="[${f_blu}\w${f_res}] "
    PS1+='$(__git_ps1 "(${f_cyn} %s${f_res}) ")'
    PS1+="${f_lgrn}󰁔 $f_res"
}

source /usr/local/bin/git-prompt.sh

export PATH="$PATH:/opt/go/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.local/bin"
export WINHOME="/mnt/c/Users/darra"

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

cd

# Enable Nord dir colors (https://www.nordtheme.com/docs/ports/dircolors/installation, see ~/./bash_dir_colors.sh)
test -r ~/.bash_dir_colors && eval $(dircolors ~/.bash_dir_colors)

eval "$(zoxide init bash --cmd cd)"
