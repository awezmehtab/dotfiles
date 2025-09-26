ssource() {
    [[ -f "$1" ]] && [[ -r "$1" ]] && source "$1"
}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
ssource "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

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

# requires zsh-autosuggestions and zsh-syntax-highlighting packages
# this varies highly based on where your package manager places these files
ssource /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ssource /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

[[ -f ~/.cache/wal/colors.sh ]] && source ~/.cache/wal/colors.sh

# Enable git prompt info
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' %b%u%c%f'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:*' actionformats ' %b|%a%u%c%f'

precmd() {
  vcs_info
}
set -o PROMPT_SUBST
# source '/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme'
# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
# if using pywal
PROMPT='%F{$color8} %~ \
%(?.%F{$color1}.%F{$color3})❯%f '
RPROMPT=""

ssource $ZDOTDIR/aliases.zsh
ssource $ZDOTDIR/funcs.zsh
ssource $ZDOTDIR/binds.zsh
ssource $ZDOTDIR/vars.zsh
ssource $ZDOTDIR/secrets.zsh
