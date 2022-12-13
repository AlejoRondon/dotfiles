# empty
# https://thevaluable.dev/zsh-line-editor-configuration-mouseless/
# bindkey -s '^o' "echo 'hola'^M"

function _reload(){
    clear
    omz reload
}

bindkey -s '^Rl' "_reload^M"

# function _say_hi {
#     zle .kill-whole-line
#     zle -U "git diff
# $CUTBUFFER"
# }

# zle -N _git-diff


# https://thevaluable.dev/zsh-line-editor-configuration-mouseless/
# function say_hi1 {
#     echo "hi!"

#     zle -U "$CUTBUFFER"
#     # $CUTBUFFER"
# }

# zle -N say_hi1
# bindkey '^Xh' say_hi1

# function say_hi2 {
#     echo "hi2!"
# }

# bindkey -s '^Xj' "say_hi2^M"
# bindkey -s '^I' "say_hi2^M"
