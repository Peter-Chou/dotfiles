
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

# can be no, normal or all; determines counting of untracked files
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal

GIT_PROMPT_THEME=Solarized

GIT_PROMPT_START="\[$bold\]\n\[$red\]\u\[$white\] at \[$yellow\]\h\[$white\] in \[$green\]\W\[$white\]"
GIT_PROMPT_END="\[$bold\]\n\[$blue\]~> \[$reset\]"


# if DISABLE_GIT_PROMPT does not exist, then source gitprompt.sh
if [[ -z "${DISABLE_GIT_PROMPT}" ]]; then
    source ~/.bash-git-prompt/gitprompt.sh;
fi


if [ -f ~/.dir_colors ]; then
  eval `dircolors ~/.dir_colors`
fi

# load env file
if [ -f ~/.env ]; then
  . ~/.env
fi

alias ..="cd .."
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# print out just the hidden files in the current working directory
alias lh='ls -lsAd --color .[^.]*'
alias ls="ls --color"
alias ll='ls -lsA --color'

#  extract tgz / tar.gz files
alias tart='tar -xvfz'

#  extract gz files
alias targ='tar -xzvf'

#  extract bz2 files
alias tarb='tar -xjvf'

alias grep='grep --color'
alias fgrep='fgrep --color'
alias egrep='egrep --color'

# search the current directory for the specified filename or expression
alias ff='find . -type f -iname'

# copy or transfer files between machines
alias rs='rsync -avz --progress --delete-after'

# create parent directory on demand
alias mkdir="mkdir -pv"
alias tree="tree -C"

# continue getting a partial-downloaded file
alias wget="wget -c"

# git shortname
alias g="git"

# Make some of the file manipulation programs verbose
alias mv="mv -v"
alias cp="cp -v"
alias :q='exit'

# alias e="emacsclient -n"
# alias ec="emacsclient -n -c"

alias goto="git checkout"
alias back="git checkout --"

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

