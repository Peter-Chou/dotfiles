# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
# DISABLE_MAGIC_FUNCTIONS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting history)

source $ZSH/oh-my-zsh.sh

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ $(ps -ax | grep dbus-daemon | wc -l) -eq 1 ]; then
	  eval `dbus-launch fcitx > /dev/null 2>&1`
fi

if [ -f ~/.dir_colors ]; then
	  eval `dircolors ~/.dir_colors`
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/peter/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/peter/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/peter/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/peter/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# wsl2 docker specific
service docker status > /dev/null || sudo service docker start

export HOST_IP=$(grep -oP '(?<=nameserver\ ).*' /etc/resolv.conf)
export PORXY_ADDR="http://$HOST_IP:1080"

# PROXY FOR APT
function proxy_apt() {
    # make sure apt.conf existed
    sudo touch /etc/apt/apt.conf
    sudo sed -i '/^Acquire::https\?::Proxy/d' /etc/apt/apt.conf
    # add proxy
    echo -e "Acquire::http::Proxy \"$PORXY_ADDR\";\nAcquire::https::Proxy \"$PORXY_ADDR\";" | sudo tee -a /etc/apt/apt.conf >/dev/null
    echo "current apt proxy status: using $PORXY_ADDR, proxying"
}

function unproxy_apt() {
    sudo sed -i '/^Acquire::https\?::Proxy/d' /etc/apt/apt.conf
    echo "current apt proxy status: direct connect, not proxying"
}

# PROXY FOR NPM
function proxy_yarn() {
    yarn config set proxy $PORXY_ADDR
    yarn config set https-proxy $PORXY_ADDR
    npm config set proxy $PORXY_ADDR
    npm config set https-proxy $PORXY_ADDR
}

function unproxy_yarn() {
    yarn config delete proxy
    yarn config delete https-proxy
    npm config delete proxy
    npm config delete https-proxy
}

function proxy_npm() {
    proxy_yarn
}

function unproxy_npm() {
    unproxy_yarn
}

# if docker is not running, then start docker service
# if docker running, then `:`, else `sudo service docker start`
# The `:` Do nothing beyond expanding arguments and performing redirections. The return status is zero.
# https://www.gnu.org/software/bash/manual/html_node/Bourne-Shell-Builtins.html#Bourne-Shell-Builtins
ps -C dockerd 1>/dev/null && : || sudo service docker start 1>/dev/null

# PROXY FOR DOCKER
function proxy_docker() {
    # make sure /etc/default/docker existed
    sudo touch /etc/default/docker
    sudo sed -i '/^export https\?_proxy/Id' /etc/default/docker
    # add proxy
    echo -e "export http_proxy=\"$PORXY_ADDR\";
export https_proxy=\"$PORXY_ADDR\";
export HTTP_PROXY=\"$PORXY_ADDR\";
export HTTPS_PROXY=\"$PORXY_ADDR\";" | sudo tee -a /etc/default/docker >/dev/null &&
        sudo service docker restart &&
        echo "current docker proxy status: using $PORXY_ADDR, proxying"
}

function unproxy_docker() {
    # sudo sed -i '/^Acquire::https\?::Proxy/d' /etc/apt/apt.conf
    # 删除代理设置
    sudo sed -i '/^export https\?_proxy/Id' /etc/default/docker &&
        sudo service docker restart &&
        echo "current docker proxy status: direct connect, not proxying"
}


# GLOBAL PROXY FOR BASH

# if ~/.bash_proxy not exist , then create it.
if [ ! -f ~/.bash_proxy ]; then
    touch ~/.bash_proxy
fi
# execute ~/.bash_proxy
. ~/.bash_proxy

function proxy() {
    echo -e "export {all_proxy,http_proxy,https_proxy,ALL_PROXY,HTTP_PROXY,HTTPS_PROXY}=\"$PORXY_ADDR\";" | tee ~/.bash_proxy >/dev/null
    # apply
    . ~/.bash_proxy
    # declare
    echo "current proxy status: using $PORXY_ADDR, proxying"
}

function unproxy() {
    # unset all_proxy http_proxy https_proxy ALL_PROXY HTTP_PROXY HTTPS_PROXY
    echo -e "unset all_proxy http_proxy https_proxy ALL_PROXY HTTP_PROXY HTTPS_PROXY" | tee ~/.bash_proxy >/dev/null
    # apply
    . ~/.bash_proxy
    # declare
    echo "current proxy status:  direct connect, not proxying"
}

(( ! ${+functions[p10k]} )) || p10k finalize
