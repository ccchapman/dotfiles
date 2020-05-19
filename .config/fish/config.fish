alias g="git"
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore -l -g "!.git" -g "!vendor" -g "!node_modules" ""'
export FZF_DEFAULT_OPTS='--preview="cat {}" --height=40%'

fish_vi_key_bindings
set fish_greeting
