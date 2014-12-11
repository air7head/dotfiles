autoload -U select-word-style
select-word-style bash

bindkey '^D' backward-kill-word
bindkey '^K' kill-line

bindkey '^P' push-input
bindkey '^H' history-beginning-search-backward

# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
