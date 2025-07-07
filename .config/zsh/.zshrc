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

for i in {0..13}; do
    export "color$i"="#ffffff"
done
export foreground="#ffffff"
export background="#000000"
export color0="$background"

# add wal colors here if you want
# ssource ~/.cache/wal/colors.sh

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
PROMPT='%K{$background}%F{$color6}%D{ %d %b} \
%K{$color0}%F{$color4} %n \
%K{$color0}%F{$color8} %~ ${vcs_info_msg_0_}%f%k \
%(?.%F{$color1}.%F{$color3})❯%f '
RPROMPT=""

ssource $ZDOTDIR/aliases.zsh
ssource $ZDOTDIR/funcs.zsh
ssource $ZDOTDIR/binds.zsh
ssource $ZDOTDIR/vars.zsh
ssource $ZDOTDIR/secrets.zsh
