export BROWSER="/usr/bin/firefox"
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/share:/usr/local/share:$HOME/.local/share"

source "$XDG_CONFIG_HOME/user-dirs.dirs"
for i in DESKTOP DOWNLOAD DOCUMENTS\
         MUSIC PICTURES VIDEOS TEMPLATES\
         PUBLICSHARE; do
    export "XDG_${i}_DIR"
done

export HISTFILE="$ZDOTDIR/.zsh_history"
export SAVEHIST=10000
export HISTSIZE=10000

typeset -U path
path=($HOME/.local/bin $HOME/usr/bin $path $HOME/usr/scripts)
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config"

export MANPAGER="nvim +Man!"
export MANWIDTH=80

export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export GHCUP_USE_XDG_DIRS=true

export HYPRSHOT_DIR="$XDG_PICTURES_DIR/screenshots"

export GPG_TTY=$(tty)

export MYVIMRC="$HOME/.config/nvim/init.lua"
export TERMINAL=kitty

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-dark

export FZF_DEFAULT_OPTS='--reverse --height 40%'
export FZF_ALT_C_OPTS='--walker-root=/home/awez --walker-skip=.mozilla,.pyvenv,.cache,.cabal,.rustup,.vscode,.local,.cargo,.ghcup,.ghc,.config/libreoffice,.config/google-chrome,/home/awez/tmp'

export STACK_ROOT="$XDG_DATA_HOME/stack"

export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
ssource() {
    [[ -f "$1" ]] && [[ -r "$1" ]] && source "$1"
}
ssource "$CARGO_HOME/env"

export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

export GDBHISTFILE="$XDG_DATA_HOME"/gdb/history

export WALLPAPER="$XDG_PICTURES_DIR/wallpaper.png"
export PYTHON="$HOME/usr/.pyvenv/"
ssource $HOME/usr/.pyvenv/bin/activate
export SCRIPTS="$HOME/usr/scripts/"
export WAL_BACKEND=wal

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export PATH="$PATH:$XDG_DATA_HOME/npm/bin"

export LC_TIME=C.UTF-8
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export TRITON_HOME="$XDG_CACHE_HOME/triton"
export SQLITE_HISTORY=$XDG_STATE_HOME/sqlite_history

export OLLAMA_MODELS="$XDG_DATA_HOME/ollama"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
