## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500
#export EDITOR=/usr/bin/nano
#export VISUAL=/usr/bin/nano
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
	bindkey "${terminfo[khome]}" beginning-of-line              # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ "${terminfo[kend]}" != "" ]]; then
	bindkey "${terminfo[kend]}" end-of-line                     # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

# Theming section
autoload -U compinit colors zcalc
compinit -d
colors

# enable substitution for prompt
setopt prompt_subst

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# Checks if working tree is dirty
parse_git_dirty() {
	local SUBMODULE_SYNTAX=''
	if [[ $POST_1_7_2_GIT -gt 0  ]]; then
		SUBMODULE_SYNTAX="--ignore-submodules=dirty"
	fi
	if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null)  ]]; then
		echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
	else
		echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
	fi
}

# get the name of the branch we are on
function git_prompt_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[red]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT='$(git_prompt_info)%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )%{$fg[yellow]%}>%{$reset_color%} '
RPROMPT='%{$fg[green]%}%~%{$reset_color%}'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"


#==============================================
# build-in, execute last command: r

## Alias section

alias ufetch='~/.ufetch'
alias inxi='~/.inxi'

alias zc='nvim ~/.zshrc'
alias ic='nvim ~/.config/i3/config'
alias nvi='nvim ~/.config/nvim/init.vim'

alias v='nvim'
alias vup='nvim +PlugUpdate +PlugUpgrade +qa'

# arch
alias i='sudo pacman -S'
alias remove='sudo pacman -Rs'
alias upd='sudo pacman -Syu'
alias cl='sudo pacman -Scc'

# deb
#alias i='sudo apt install'
#alias remove='sudo apt remove'
#alias autoremove='sudo apt autoremove && sudo apt --purge autoremove'
#alias upd='sudo apt update && sudo apt dist-upgrade && sudo snap refresh'
#alias cl='sudo apt autoclean && sudo apt clean'

alias c='clear'

alias q='exit'

alias t='touch'
alias mk='mkdir'

alias rb='reboot'
alias sdn='shutdown now'
alias sdh='shutdown -h'
alias sdc='shutdown -c'

alias sh='systemctl hibernate'

alias ss='systemctl suspend'
# 3600 == one hour
alias s30='sleep 1800 && systemctl suspend'
alias s45='sleep 2700 && systemctl suspend'
alias s1='sleep 3600 && systemctl suspend'
alias s2='sleep 7200 && systemctl suspend'
alias s3='sleep 10800 && systemctl suspend'

# python
alias pp='pyenv activate python-pyenv'
alias py='python'
alias ipy='python -m IPython'

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# turf off highlighting directories are writable by other
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
