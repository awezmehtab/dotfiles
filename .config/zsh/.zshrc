ssource() {
    [[ -f "$1" ]] && [[ -r "$1" ]] && source "$1"
}

eval "$(dircolors -b)"

fpath+="$ZDOTDIR/completions"
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

bindkey -e
bindkey "^[[Z" reverse-menu-complete

setopt auto_param_slash
setopt extended_glob
setopt interactive_comments
setopt autocd

ssource $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
ssource $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

ssource $ZDOTDIR/colors.zsh

set -o PROMPT_SUBST
PROMPT1='%F{$color8} %1~ %(?.%F{$color2}.%F{$color1})❯%f '
PROMPT2='%F{$color8} %~ %(?.%F{$color2}.%F{$color1})❯%f '
PROMPT="$PROMPT2"
RPROMPT=""

ssource "$ZDOTDIR/aliases.zsh"
ssource "$ZDOTDIR/funcs.zsh"
ssource "$ZDOTDIR/binds.zsh"
ssource "$ZDOTDIR/vars.zsh"
ssource "$ZDOTDIR/secrets.zsh"

export PATH="$PATH:$HOME/opt/clab"
