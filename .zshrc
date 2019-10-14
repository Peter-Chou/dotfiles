# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"

# Visual customisation of the second prompt line
 local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
  user_symbol = "#"
fi

POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"

POWERLEVEL9K_TIME_FORMAT='%D{%m/%d %a %H:%M}'

POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

# POWERLEVEL9K_SHORTEN_DELIMITER=""

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir dir_writable virtualenv vcs)

POWERLEVEL9K_SHOW_CHANGESET=true

POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

DISABLE_AUTO_TITLE="true"

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'

POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         dotenv
)

source $ZSH/oh-my-zsh.sh

source ~/.oh-my-zsh/plugins/incr/incr*.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
if [ -f ~/.dir_colors ]; then
  eval `dircolors ~/.dir_colors`
fi

if [ $(ps -ax | grep dbus-daemon | wc -l) -eq 1 ]; then
  eval `dbus-launch fcitx > /dev/null 2>&1`
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

# Make some of the file manipulation programs verbose
alias mv="mv -v"
# alias cp="cp -v"
alias :q='exit'

alias eo="emacsclient -n"
alias ec="emacsclient -c -a ''"

alias goto="git checkout"

alias zp=". ~/.zprofile"
alias zr=". ~/.zshrc"
alias zm="vim ~/.zshrc"

# WSL config
export DISPLAY=:0
export NO_AT_BRIDGE=1

export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# python, pipenv
export PATH=$HOME/miniconda3/bin:$PATH
export PATH="$PATH:$HOME/.local/bin"
export PIPENV_PYPI_MIRROR="https://pypi.tuna.tsinghua.edu.cn/simple"
export WORKON_HOME="$HOME/.virtualenvs"

# JAVA 
export JAVA_HOME=$HOME/java/jdk1.8.0_221
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

# maven
export M2_HOME=$HOME/maven
export PATH=$M2_HOME/bin:$PATH
