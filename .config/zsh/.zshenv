export ZDOTDIR="$HOME/.config/zsh/"
ssource() {
    [[ -f "$1" ]] && [[ -r "$1" ]] && source "$1"
}
