mkcd() {
    [[ -n "$1" ]] && mkdir -p "$1" && cd "$1"
}
