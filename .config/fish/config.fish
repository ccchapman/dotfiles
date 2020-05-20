alias g="git"
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore -l -g "!.git" -g "!vendor" -g "!node_modules" ""'
export FZF_DEFAULT_OPTS='
--preview="cat {}"
--height=40%
--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
'

fish_vi_key_bindings
set fish_greeting

function fish_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
    echo -n ' '
end

function fish_right_prompt
end
