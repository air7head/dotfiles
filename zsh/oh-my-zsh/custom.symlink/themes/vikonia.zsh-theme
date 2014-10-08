function get_host {
  user=`whoami`
  host=`hostname`
  host=${host/smartdeals/sd}
  host=${host/-cdh4/-c}
  host=${host/-hadoop-util/-h-u}
  host=${host/-lup1/-l}
  if [[ ${user} == 'asinharoy' ]]; then
    echo '@'`hostname`''
  else
    echo ${user}'@'${host}
  fi
}

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"

#PROMPT='${return_code}%{$fg[red]%}%(!.#.»)%{$reset_color%} '
PROMPT='${return_code}%{$fg[red]%}%(!.#.»)%{$reset_color%} '

RPROMPT='$(git_prompt_info) [%{$fg[blue]%}%j%{$reset_color%}] [%{$fg[blue]%}%T%{$reset_color%}] %{$fg[cyan]%}%3c%{$reset_color%} %{$fg[yellow]%}%n%{$fg[cyan]%}@%m%{$reset_color%}'
 
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"
