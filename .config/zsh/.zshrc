ssource() {
    [[ -f "$1" ]] && [[ -r "$1" ]] && source "$1"
}

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

ssource /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ssource /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

ssource $ZDOTDIR/colors.zsh

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
PROMPT='%F{$color8} %~ \
%(?.%F{$color2}.%F{$color1})❯%f '
# PROMPT='%F{#11ff55} %~ \
# %(?.%F{$color1}.%F{#ff5555})❯%f '
# PROMPT='%~ %(?)❯%f '
RPROMPT=""

ssource "$ZDOTDIR/aliases.zsh"
ssource "$ZDOTDIR/funcs.zsh"
ssource "$ZDOTDIR/binds.zsh"
ssource "$ZDOTDIR/vars.zsh"
ssource "$ZDOTDIR/secrets.zsh"
ssource "$ZDOTDIR/completions/bw.zsh"

unset DRI_PRIME
