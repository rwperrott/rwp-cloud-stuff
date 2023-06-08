#!/bin/sh

# I created these terraform aliases because these terraform commands are too much typing.
# The functions are to capture and convert, using tee and ansi2txt, the produced ansi text for easier viewing
#   e.g. in VSCode/VSCodium
# To install ansi2txt on a debian based OS, in a terminal, type: sudo apt install colorized-logs

# To install these aliases, append to ~/.bash_aliases.
# To refresh aliases in a current bash terminal, type: exec bash

# Full aliases for main terraform commands
alias tinit='terraform init'
alias tvalidate='terraform validate'
tplan() { # $* for options, like -help etc.
  terraform plan -out terraform.plan $* |& tee temp.ansi
  ansi2txt < temp.ansi > terraform.out.txt
  rm temp.ansi
}
tapply() { # $* for options, like -help etc.
  terraform apply $* |& tee temp.ansi
  ansi2txt < temp.ansi > terraform.out.txt
  rm temp.ansi
}
tdestroy() { # $* for options, like -help etc.
  terraform destroy $* |& tee temp.ansi
  ansi2txt < temp.ansi > terraform.out.txt
  rm temp.ansi
}

# All other terraform commands
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

# Short aliases for terraform commands
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

