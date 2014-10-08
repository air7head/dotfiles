# Sometimes the zsh correction behavior is irritating:
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias touch='nocorrect touch'
alias ln='nocorrect ln'
alias dig='nocorrect dig'
alias timestamp="date -j -f \"%a %b %d %T %Z %Y\" \"`date`\" \"+%s\""

function mkd(){
  mkdir -p $1
  cd $1
}
# Safety first
alias rm='rm -i'

#rsync instead of scp, with partial transfer
alias rscp='rsync --archive --compress --stats --progress --partial --rsh="ssh"'
alias rscpq='rsync --quiet --archive --compress --stats --progress --partial --rsh="ssh"'
alias rscpd='rsync --delete --archive --compress --stats --progress --partial --rsh="ssh"'
alias rsmv='rscp --remove-source-files'

alias mvn='nocorrect mvn -q' 

#alias cd\?="dirdump; typeset -U dirs_shared; dirstack"

alias glgg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --max-count=40"
alias glgga="glgg --author=$USER"
alias gds="gd --stat"

alias -g L="| less"

alias t="task rc:.taskrc"
alias vtw="TASKDATA=~/.task/work vim +TW" # Work tasks list
alias vth="TASKDATA=~/.task/home vim +TW" # Personal tasks list

alias :q="exit"
alias :qa="exit"
