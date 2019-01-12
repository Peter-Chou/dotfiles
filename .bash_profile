
bold='';
reset="\e[0m";
black="\e[1;30m";
blue="\e[1;34m";
cyan="\e[1;36m";
green="\e[1;32m";
orange="\e[1;33m";
purple="\e[1;35m";
red="\e[1;31m";
violet="\e[1;35m";
white="\e[1;37m";
yellow="\e[1;33m";

PS1="\[$bold\]\n\[$red\]\u\[$white\] at \[$yellow\]\h\[$white\] in \[$green\]\W\[$white\]
\[$blue\]~> \[$reset\]"
export PS1

# git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
# only enable bash-git-prompt within git repository
GIT_PROMPT_ONLY_IN_REPO=1

# uncomment to avoid setting virtual environment infos for node/python/conda environments
GIT_PROMPT_WITH_VIRTUAL_ENV=0

GIT_PROMPT_THEME=Solarized

GIT_PROMPT_START="\[$red\]\u\[$white\] at \[$yellow\]\h\[$white\] in \[$green\]\W\[$white\]"
GIT_PROMPT_END="\[$bold\]\n\[$blue\]~> \[$reset\]"

source ~/.bash-git-prompt/gitprompt.sh

if [ -f ~/.dir_colors ]; then
  eval `dircolors ~/.dir_colors`
fi

# alias
alias c="clear"
alias ..="cd .."
alias ls="ls --color=auto"
alias ll="ls -AlhF --color=auto"
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree="tree -C"
# create parent directory on demand
alias mkdir="mkdir -pv"
# continue getting a partial-downloaded file
alias wget="wget -c"

# Make some of the file manipulation programs verbose
alias mv="mv -v"
alias cp="cp -v"

alias :q='exit'

alias g="git"
alias goto="git checkout"

alias e="emacsclientw -n"
alias ec="emacsclientw -n -c"

alias bp=". ~/.bash_profile"
alias br=". ~/.bashrc"

# use ssh-aws IPv4 address to access aws virtual machine. example:
# ssh-aws 54.186.182.19
function ssh-aws()
{
	ssh -i ${HOME}/.ssh/udacity.pem -o StrictHostKeyChecking=no ubuntu@$1
}

# example: sftp-aws 54.186.182.19
function sftp-aws()
{
	sftp -i ${HOME}/.ssh/udacity.pem -o StrictHostKeyChecking=no ubuntu@$1
}

export TERM=xterm-256color

