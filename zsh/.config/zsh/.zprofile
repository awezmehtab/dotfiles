export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/share:/usr/local/share:$HOME/.local/share"

ssource "$XDG_CONFIG_HOME/user-dirs.dirs"
: "${XDG_DESKTOP_DIR:=$HOME/Desktop}"
: "${XDG_DOWNLOAD_DIR:=$HOME/Downloads}"
: "${XDG_DOCUMENTS_DIR:=$HOME/Documents}"
: "${XDG_MUSIC_DIR:=$HOME/Music}"
: "${XDG_PICTURES_DIR:=$HOME/Pictures}"
: "${XDG_VIDEOS_DIR:=$HOME/Videos}"
: "${XDG_TEMPLATES_DIR:=$HOME/Templates}"
: "${XDG_PUBLICSHARE_DIR:=$HOME/Public}"
export XDG_DESKTOP_DIR XDG_DOWNLOAD_DIR XDG_DOCUMENTS_DIR \
       XDG_MUSIC_DIR XDG_PICTURES_DIR XDG_VIDEOS_DIR \
       XDG_TEMPLATES_DIR XDG_PUBLICSHARE_DIR

typeset -U path
path=($HOME/.local/bin $path $XDG_DATA_HOME/npm/bin)

## core
export EDITOR="nvim"
export BROWSER="/usr/bin/firefox"
export TERMINAL=kitty
export MANPAGER="nvim +Man!"
export MANWIDTH=80

## zsh related
mkdir -p "$XDG_STATE_HOME/zsh" "$XDG_CACHE_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export SAVEHIST=10000
export HISTSIZE=10000

## locale
export LC_TIME=C.UTF-8

## secrets related
# GNUPGHOME must be set before gpgconf is queried.
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
command -v gpgconf >/dev/null && export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

## shared by both Hyprland and sway
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-dark

## toolchains
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
ssource "$CARGO_HOME/env"

export GHCUP_USE_XDG_DIRS=true
export STACK_ROOT="$XDG_DATA_HOME/stack"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

## tool histories
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export GDBHISTFILE="$XDG_DATA_HOME"/gdb/history
export SQLITE_HISTORY=$XDG_STATE_HOME/sqlite_history
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"

## tool configs
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export W3M_DIR="$XDG_DATA_HOME/w3m"

export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"

## venv shit
export VIRTUAL_ENV_DISABLE_PROMPT=1
ssource "$XDG_DATA_HOME/venv/main/bin/activate"

## cuda
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export TRITON_HOME="$XDG_CACHE_HOME/triton"
export OLLAMA_MODELS="$XDG_DATA_HOME/ollama"

## vms
export LIBVIRT_DEFAULT_URI=qemu:///system

## fzf
export FZF_DEFAULT_OPTS='--reverse --height 40%'
export FZF_ALT_C_OPTS='--walker-root=/home/awez --walker-skip=.mozilla,.cache,.rustup,.vscode,.local,.cargo,.ghcup,.ghc,.config/libreoffice,.config/google-chrome'

## desktop
export WALLPAPER="$XDG_PICTURES_DIR/wallpaper.png"
export WAL_BACKEND=wal
export HYPRSHOT_DIR="$XDG_PICTURES_DIR/screenshots"
