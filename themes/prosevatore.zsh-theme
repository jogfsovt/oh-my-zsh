function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

PROMPT='
[%{$fg_no_bold[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}$(box_name)%{$reset_color%}]-[%{$fg_no_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}]$(git_prompt_info)$(virtualenv_info)%(?,,-[%{${fg_no_bold[red]}%}%?%{$reset_color%}] )$ '

ZSH_THEME_GIT_PROMPT_PREFIX="-[%{$fg[magenta]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"
RPROMPT='${return_status}%{$reset_color%}'
