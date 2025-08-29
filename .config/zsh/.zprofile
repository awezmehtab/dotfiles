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
export GIT_CONFIG_GLOBAL=~/.config/git/config

export MANPAGER="nvim +Man!"
export MANWIDTH=80

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export GHCUP_USE_XDG_DIRS=true

# For screenshots
export HYPRSHOT_DIR="$XDG_PICTURES_DIR/screenshots"

# GPG Password
export GPG_TTY=$(tty)

export MYVIMRC="$HOME/.config/nvim/init.lua"
export TERMINAL=kitty

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-dark

export FZF_DEFAULT_OPTS='--reverse --height 40%'
export FZF_ALT_C_OPTS='--walker-root=/home/awez --walker-skip=.mozilla,.pyvenv,.cache,.cabal,.rustup,.vscode,.local,.cargo,.ghcup,.ghc,.config/libreoffice,.config/google-chrome'

export STACK_ROOT="$XDG_DATA_HOME/stack"

export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
ssource() {
    [[ -f "$1" ]] && [[ -r "$1" ]] && source "$1"
}
ssource "$XDG_DATA_HOME/cargo/env"

export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

export GDBHISTFILE="$XDG_DATA_HOME"/gdb/history

# For zsh completion system colors
eval $(dircolors -b)
export ZLS_COLORS=$LS_COLORS

export WALLPAPER="$XDG_PICTURES_DIR/wallpaper.png"
export PYTHON="$HOME/usr/.pyvenv/"
ssource ~/usr/.pyvenv/bin/activate
export SCRIPTS="$HOME/usr/scripts/"
export WAL_BACKEND= #  "modern_colorthief"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export PATH="$PATH:$XDG_DATA_HOME/npm/bin"
unset DRI_PRIME

# Android dev
export ANDROID_SDK_ROOT=/home/awez/usr/android
export ANDROID_HOME=$ANDROID_SDK_ROOT
export ANDROID_AVD_HOME=$XDG_CONFIG_HOME/android/avd
export ANDROID_SDK_HOME=$XDG_CONFIG_HOME/android
path=($path $ANDROID_SDK_ROOT/cmdline-tools/latest/bin $ANDROID_SDK_ROOT/platform-tools $ANDROID_SDK_ROOT/emulator)
