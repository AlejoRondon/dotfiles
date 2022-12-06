# empty

bindkey -s '^o' "echo 'hola'^M"

function _reload1(){
    clear
    omz reload
}

bindkey -s '^Xd' "_reload1^M"

# function _say_hi {
#     zle .kill-whole-line
#     zle -U "git diff
# $CUTBUFFER"
# }

# zle -N _git-diff


# https://thevaluable.dev/zsh-line-editor-configuration-mouseless/
function _say_hi1 {
    echo "hi!"
    
    zle -U "$CUTBUFFER"
    # $CUTBUFFER"
}

zle -N _say_hi1
bindkey '^Xh' _say_hi1

function _say_hi2 {
    echo "hi2!"
}

bindkey -s '^Xj' "_say_hi2^M"
bindkey -s '^i' "_say_hi2^M"
