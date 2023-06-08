#!/bin/sh

alias aws-ssh="ssh -i /home/richard/.aws/ssh//home/richard/.aws/pems"

# SSO Start URL: https://d-9c670d407f.awsapps.com/start#
# SSO Region:    eu-west-2
# SSO Session:   richard
alias aws-configure-sso='aws configure sso --output json --profile AWSAdministratorAccess-777336335779 --region eu-west-2'

alias aws-login='aws sso login --sso-session richard'

alias aws-logout='aws sso logout'

alias aws-caller-id='aws sts get-caller-identity --query "Account" --profile AWSAdministratorAccess-777336335779'

function aws-is-login() {
    SSO_ACCOUNT=$(aws sts get-caller-identity --query "Account" --profile AWSAdministratorAccess-777336335779)
    #you can add a better check, but this is just an idea for quick check
    if [ ${#SSO_ACCOUNT} -eq 14 ];  then
        echo "session still valid" ;
    else
        echo "Seems like session expired"
    # performed login here
fi
}

alias aws-cli='aws $* --profile AWSAdministratorAccess-777336335779'

aws-profile() {
    export AWS_PROFILE='AWSAdministratorAccess-777336335779'
}

aws-unset() {
    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_SESSION_TOKEN
}
