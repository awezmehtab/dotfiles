bindkey '^@' clear-screen

toggle_prompt() {
    if [ "$PROMPT" = "$PROMPT1" ]; then
        PROMPT="$PROMPT2";
    else
        PROMPT="$PROMPT1";
    fi
    zle reset-prompt
}
zle -N toggle_prompt
bindkey '^P' toggle_prompt
bindkey -s '^o' 'lf\n'
