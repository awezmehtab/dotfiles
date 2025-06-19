# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# enables colored completion
zstyle ':completion:*' list-colors "${(s.:.)ZLS_COLORS}"
bindkey -e
bindkey "^[[Z" reverse-menu-complete

setopt auto_param_slash
setopt extended_glob
setopt interactive_comments
setopt autocd

# autosuggestions
# requires zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
# requires zsh-syntax-highlighting package
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ll='ls -alHhv --color --group-directories-first'
alias l='ls -alhHv --color --group-directories-first'
alias ls='ls --color'
alias less='less -R'

source <(fzf --zsh)

source ~/.pyvenv/bin/activate
alias pyvenv="source $HOME/.pyvenv/bin/activate"

[[ -f ~/.cache/wal/colors.sh ]] && source ~/.cache/wal/colors.sh
# Enable git prompt info
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' formats '%F{$color6} %b%u%c%f '
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:*' actionformats '%F{$color6} %b|%a%u%c%f '

precmd() {
  vcs_info
}

set -o PROMPT_SUBST

NEWLINE=$'\n'
# PROMPT="%K{#2E3440}%F{#E5E9F0}%D{ %d %b} %K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %~ %f%k ❯ "
# PROMPT='%K{#2E3440}%F{#E5E9F0}%D{ %d %b} %K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %~ %f%k %(?.%F{#A3BE8C}.%F{#BF616A})❯%f '
# PROMPT="%F{#4C566A}%D{ %d %b} %F{#5E6777} %n %F{#6B7280} %~ ❯ "
# RPROMPT="$VIRTUAL_ENV_PROMPT"
# source '/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme'
# PROMPT='%K{#2E3440}%F{#88C0D0}%D{ %d %b} %K{#3B4252}%F{#88C0D0} %n %K{#4C566A}%F{#88C0D0} %~ ${vcs_info_msg_0_}%f%k %(?.%F{#A3BE8C}.%F{#BF616A})❯%f '
# if using pywal
PROMPT='%K{$background}%F{$color6}%D{ %d %b} \
%K{$color0}%F{$color4} %n \
%K{$color1}%F{$foreground} %~ ${vcs_info_msg_0_}%f%k \
%(?.%F{$color1}.%F{$color3})❯%f '
RPROMPT=""

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

open_file() {
    viewer=$1
    file=$(fzf --style minimal --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {} --walker=file,dir,hidden,follow' < <(fd)) 
    if [[ ! -n "$file" ]]; then
        zle reset-prompt
        return
    fi
    case "$file" in
        *.pdf) $viewer "$file" &>/dev/null &!;;
        *) nvim "$file" ;;
    esac
    zle reset-prompt
}

zathura() {
    /usr/bin/zathura "$@" 2>/dev/null 1>/dev/null &!
}

open_zathura() { open_file zathura }

zle -N open_zathura
bindkey '^o' open_zathura
bindkey '^@' clear-screen

WORDCHARS=''

alias eza='eza --total-size --git --icons --sort=size -al'
alias e='eza --total-size --git --icons -al'
alias imv='imv'

export GPG_TTY=$(tty)
