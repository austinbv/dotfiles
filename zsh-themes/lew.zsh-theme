
PROMPT='%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} $(git_cwd_info)
$(prompt_char) > '

RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{blue})%F{yellow}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{blue})"

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

function who_is_here {
  who | cut -c 1-9 | grep -v austinbv | sed 's/ *$//g' | sed  's/$/ is here/g' 
}

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-N-}/(main|viins)/-I-}%{$fg_bold[red]%} $(who_is_here)%{$reset_color%}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
