# Enable tab completion
source ~/.terminal-config/git-completion.bash

# Change command prompt
source ~/.terminal-config/git-prompt.sh

# colors!
# red="\[\033[38;5;203m\]"
# green="\[\033[38;05;38m\]"
# blue="\[\033[0;34m\]"
# reset="\[\033[0m\]"

export GIT_PS1_SHOWDIRTYSTATE=1

# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
# export PS1="$red\u$green\$(__git_ps1)$blue \W
# $ $reset"

# modifyed follow https://www.youtube.com/watch?v=LXgXV7YmSiU
# orange=$(tput setaf 166)
# yellow=$(tput setaf 228)
# green=$(tput setaf 120)
# white=$(tput setaf 15)
# blue=$(tput setaf 45)
# bold=$(tput bold)
# reset=$(tput sgr0)

if tput setaf 1 &> /dev/null; then
	tput sgr0; # reset colors
	bold=$(tput bold);
	reset=$(tput sgr0);
	# Solarized colors, taken from http://git.io/solarized-colors.
	black=$(tput setaf 0);
	blue=$(tput setaf 45);
	cyan=$(tput setaf 37);
	green=$(tput setaf 120);
	orange=$(tput setaf 166);
	purple=$(tput setaf 125);
	red=$(tput setaf 124);
	violet=$(tput setaf 61);
	white=$(tput setaf 15);
	yellow=$(tput setaf 228);
else
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
fi;


PS1="\[$bold\]\n\[$orange\]\u\[$white\] at \[$yellow\]\h\[$white\] in \[$green\]\W\$(__git_ps1)
\[$white\]~> \[$reset\]"
export PS1

# PS1="\[${bold}\]\n";
# PS1+="\[${orange}\]\u";
# PS1+="\[${white}\] at ";
# PS1+="\[${yellow}\]\h";
# PS1+="\[${white}\] in ";
# PS1+="\[${green}\]\W";
# PS1+=" \[${blue}\]\$(__git_ps1)";
# PS1+="\[\n${white}\]\$ \[${reset}\]";
# export PS1;﻿

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

export PATH="/cygdrive/c/Anaconda3:$PATH"

