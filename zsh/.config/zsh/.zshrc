command -v dircolors &>/dev/null && eval "$(dircolors -b)"

fpath+=("${XDG_DATA_HOME:-$HOME/.local/share}/zsh/site-functions")
zmodload zsh/complist
autoload -U compinit && compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

bindkey -e
bindkey "^[[Z" reverse-menu-complete

setopt auto_param_slash extended_glob interactive_comments autocd prompt_subst

command -v fzf &>/dev/null && source <(fzf --zsh)
ssource $ZDOTDIR/plugins.zsh
ssource $ZDOTDIR/aliases.zsh
ssource $ZDOTDIR/funcs.zsh
ssource $ZDOTDIR/binds.zsh
ssource $ZDOTDIR/vars.zsh

PROMPT1='%F{8} %1~ %(?.%F{2}.%F{1})❯%f '
PROMPT2='%F{8} %~ %(?.%F{2}.%F{1})❯%f '
PROMPT3='%F{8} $(shrink_path -f) %(?.%F{2}.%F{1})❯%f '
PROMPT="$PROMPT3"
RPROMPT=""
