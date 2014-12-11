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

alias ps_dev='mysql -u dps_test -p pricing_service_dev -h pricing-db1-dev.snc1 -pdpc_passwd12'
alias ps_uat='mysql -u dps_test -p pricing_service_uat -h pricing-db1-uat.snc1 -pdpc_passwd12'
alias ps_prod='mysql -u dynamic_pricing -p pricing_service -h pricing-db-replica-vip.snc1 -ppscsvb_Rx6884'
alias ps_staging='mysql -u dps_test -p pricing_service_staging -h pricing-db-staging-replica-vip -pdpc_passwd12'

alias vts_uat='mysql -u dps_test -pNzVmZWI4NW -h voucher-txn-service-db1-uat.snc1'
alias vts_staging="ssh -t dynamic-price-control-center-app1.snc1 'mysql -h voucher-service-db-staging-replica-vip.snc1 -u voucher_service -pvscsvb_Rx2803 voucher_txn_db_staging'"
alias vts_prod='mysql -h voucher-txn-service-db3.snc1 -u vts_adhoc -pvtsdhoc_passwd12 voucher_txn_db'

alias pwa_uat='mysql -u thepoint_db -p groupon_uat -h uat-db1.snc1 -pj4r1r8s9'
alias pwa_staging='mysql -u thepoint_db -p groupon_staging -h master-groupon-staging-snc1.snc1 -pj4r1r8s9'
alias pwa='mysql -u thepoint_db -p groupon_production -h db-replica-vip.snc1 -pj4r1r8s9'

