export PATH="$HOME/.local/bin:$HOME/usr/bin:$PATH"
export HISTFILE="$ZDOTDIR/.zsh_history"
export GIT_CONFIG_GLOBAL=~/.config/git/config

export MANPAGER="nvim +Man!"
export MANWIDTH=80

# The system looks here for themes etc.
export XDG_DATA_DIRS="/usr/share:/usr/local/share:$HOME/.local/share"

export PATH="$PATH:$HOME/.ghcup/bin/:$HOME/.cabal/bin"

# For screenshots
export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"

# GPG Password
export GPG_TTY=$(tty)

# Added by Toolbox App
export PATH="$PATH:/home/awez/.local/share/JetBrains/Toolbox/scripts"

export TENSORRT_ROOT=~/opt/TensorRT-10.8.0.43
export LD_LIBRARY_PATH=$TENSORRT_ROOT/lib:$LD_LIBRARY_PATH
export PATH=$TENSORRT_ROOT/bin:$PATH

export CUDA_INSTALL_DIR=/opt/cuda
export TRT_LIB_DIR="$TENSORRT_ROOT/lib"
