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
orange=$(tput setaf 166)
yellow=$(tput setaf 228)
green=$(tput setaf 120)
white=$(tput setaf 15)
blue=$(tput setaf 45)
bold=$(tput bold)
reset=$(tput sgr0)

PS1="\[$bold\]\n\[$orange\]\u\[$white\]@\[$yellow\]\h\[$white\] in \[$green\]\W\$(__git_ps1)
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

alias ls="ls -AlhF --color=auto"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree="tree -C"

# Make some of the file manipulation programs verbose
alias mv="mv -v"
alias rm="rm -v"
alias cp="cp -v"

alias :q='exit'

alias e="emacsclientw -n"
alias ec="emacsclientw -n -c"

export PATH="/cygdrive/c/Anaconda3:$PATH"
