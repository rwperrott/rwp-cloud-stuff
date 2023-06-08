#!/bin/sh

alias k=kubectl
complete -o default -F __start_kubectl k

alias kversion='k version --output yaml'

alias kall='k get all'
alias knodes='k get nodes'
alias knodes='k get nodes'
alias kpods='k get pods'
alias klogs='k get logs'
alias kservices='k get services'

alias kapply='k apply'
alias kapplyf='kapply -f'

## kubectl delete
# 
# kubectl delete -f [file.json|file.yaml|*.json|*.yaml]
# kubectl delete [pod,?|pods,?|service,?|services,?]+ (list of names)
# kubectl delete [pod,?|pods,?|service,?|services,?]+ -l lable-name=label-value
alias kdelete='k delete'
alias kdeletef='k -f'

# Shorter aliases
alias krun='k apply'
alias krunf='k apply -f'

alias kkill='k delete --now=true --wait=true --cascade=foreground'
alias kkillf='kkill -f'

function kkillall {
  kkillf '*.yaml'
  kkillf '*.json'
}

