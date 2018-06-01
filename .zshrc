# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# set gruvbox color
dark0_hard="#1D2021"
dark0="#282828"
dark0_soft="#32302F"
dark1="#3c3836"
dark2="#504945"
dark3="#665c54"
dark4="#7C6F64"

gray_245="#928374"
gray_244="#928374"

light0_hard="#FB4934"
light0="#FBF1C7"
light0_soft="#F2E5BC"
light1="#EBDBB2"
light2="#D5C4A1"
light3="#BDAE93"
light4="#A89984"

bright_red="#FB4934"
bright_green="#B8BB26"
bright_yellow="#FABD2F"
bright_blue="#83A598"
bright_purple="#D3869B"
bright_aqua="#8EC07C"
bright_orange="#FE8019"

neutral_red="#CC241D"
neutral_green="#98971A"
neutral_yellow="#D79921"
neutral_blue="#458588"
neutral_purple="#B16286"
neutral_aqua="#689D6A"
neutral_orange="#D65D0E"

faded_red="#9D0006"
faded_green="#79740E"
faded_yellow="#B57614"
faded_blue="#076678"
faded_purple="#8F3F71"
faded_aqua="#427B58"
faded_orange="#AF3A03"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
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
alias e="emacsclient -n"
alias ec="emacsclient -n -c"
alias zp=". ~/.zprofile"
alias zr=". ~/.zshrc"
# use customized dir color
if [ -f ~/.dir_colors ]; then
  eval `dircolors ~/.dir_colors`
fi
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

if [ -d "$HOME/anaconda3" ] && [[ ":$PATH:" != *":$HOME/anaconda3/bin:"* ]]; then
    export PATH="$HOME/anaconda3/bin:$PATH"
fi

if [ $(ps -ax | grep dbus-daemon | wc -l) -eq 1 ]; then
  eval `dbus-launch fcitx > /dev/null 2>&1`
fi
