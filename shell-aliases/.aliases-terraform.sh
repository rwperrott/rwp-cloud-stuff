
#
# Full aliases for main terraform commands
#
alias tinit='terraform init'
alias tvalidate='terraform validate'

# tplan, tapply, and tdestroy capture stdout & stderr, via tee to temp.ansi,
#   and ansi2txt this to convert the captured ansi text into standard text for easier viewing
#   e.g. in VSCode, VSCodium, or IntelliJ IDEA, etc.
#
# See https://github.com/kilobyte/colorized-logs for ansi2txt.
# To install ansi2txt on an ubuntu based OS, in a terminal, type: sudo apt install colorized-logs

tplan() { # $* for options, like -help etc.
  # shellcheck disable=SC2048
  # shellcheck disable=SC2086
  terraform plan -out terraform.plan $* |& tee temp.ansi
  ansi2txt < temp.ansi > terraform.out.txt
  rm temp.ansi
}

tapply() { # $* for options, like -help etc.
  # shellcheck disable=SC2048
  # shellcheck disable=SC2086
  terraform apply $* |& tee temp.ansi
  ansi2txt < temp.ansi > terraform.out.txt
  rm temp.ansi
}

tdestroy() { # $* for options, like -help etc.
  # shellcheck disable=SC2048
  # shellcheck disable=SC2086
  terraform destroy $* |& tee temp.ansi
  ansi2txt < temp.ansi > terraform.out.txt
  rm temp.ansi
}

#
# Full aliases for all other terraform commands
#
alias tconsole='terraform console'
alias tfmt='terraform fmt'
alias tforce-unlock='terraform force-unlock'
alias tget='terraform get'
alias tgraph='terraform graph'
alias timport='terraform import'
alias tlogin='terraform login'
alias tlogout='terraform logout'
alias tmetadata='terraform metadata'
alias toutput='terraform output'
alias tout='terraform output'
alias tproviders='terraform providers'
alias trefresh='terraform refresh'
alias tshow='terraform show'
alias tstate='terraform state'
alias ttaint='terraform taint'
alias ttest='terraform ttest'
alias tuntaint='terraform untaint'
alias tversion='terraform version'
alias tworkspace='terraform workspace'

#
# Shorter aliases for terraform commands
#
alias tval='tvalidate'
alias trun='tapply'
alias tauto='tapply -auto-approve'
alias tkill='tdestroy'
alias tsh='tconsole'
alias tcrack='tforce-unlock'
alias tmeta='tmetadata'
alias tprov='terraform providers'
alias tpull='trefresh'
alias tver='tversion'
alias tws='tworkspace'

