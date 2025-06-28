bindkey '^@' clear-screen

function run-lf() {
  zle reset-prompt
  lf
  zle redisplay
}
zle -N run-lf
bindkey '^O' run-lf
