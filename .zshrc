# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/solus/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="wezm"
#ZSH_THEME="af-magic"

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

plugins=(
	git
	zsh-syntax-highlighting
	history-substring-search
	zsh-autosuggestions
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


#######################################################################3
# aliases
alias ufetch='~/.ufetch'

alias zc='nvim ~/.zshrc'
alias ic='nvim ~/.config/i3/config'
alias nvi='nvim ~/.config/nvim/init.vim'

alias v='nvim'
alias vup='nvim +PlugUpdate +PlugUpgrade +qa'

# alias tcli='telegram-cli --permanent-msg-ids'
# alias tcli='telegram-cli --enable-msg-id'
alias tl='telegram-cli -N'

# arch
alias i='sudo pacman -S'
alias remove='sudo pacman -Rs'
alias upd='sudo pacman -Syu'
alias yupd='yay -Syu'
alias cl='sudo pacman -Scc'

# deb
# alias i='sudo apt install'
# alias remove='sudo apt remove'
# alias autoremove='sudo apt autoremove && sudo apt --purge autoremove'
# alias upd='sudo apt update && sudo apt dist-upgrade && sudo snap refresh'
# alias cl='sudo apt autoclean && sudo apt clean'

alias c='clear'

alias q='exit'

alias t='touch'
alias mk='mkdir'

alias rb='reboot'
alias sdn='shutdown now'
alias sdh='shutdown -h'
alias sdc='shutdown -c'
alias sn='sleep 2099 && shutdown now' # 34 min 59 sec

alias ss='systemctl suspend'
# 3600 == one hour
alias s30='sleep 1800 && systemctl suspend'
alias s45='sleep 2700 && systemctl suspend'
alias s1='sleep 3600 && systemctl suspend'
alias s2='sleep 7200 && systemctl suspend'
alias s3='sleep 10800 && systemctl suspend'

# python
alias pp='pyenv activate python-pyenv'
alias py='python3'
alias ipy='ipython'
# alias ipy='python -m IPython'
# alias ipy='pyenv activate python-pyenv && ipython'

# pyenv
alias pa='pyenv activate'
alias pd='pyenv deactivate'
alias pi='pyenv install'

# django
alias dsp='django-admin startproject'
alias dsa='python manage.py startapp'
alias drs='python manage.py runserver'
alias dm='python manage.py migrate'
alias dmm='python manage.py makemigrations'
alias ds='python manage.py shell'

# tmux
alias ta='tmux a -t' # attach to a session with the name mysession
alias tal='tmux a' # attach to last session
alias tns='tmux new -s' # start new session + session name

# git
alias gts='git status'
alias gta='git add .'
alias gtc='git commit -m'
alias gtp='git push origin'

#######################################################################3


export TERM=xterm-256color


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# turf off highlighting directories are writable by other
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

export DP_ROOT="$HOME/.django_project"
export PATH="$PATH:/$HOME/.django_project"
