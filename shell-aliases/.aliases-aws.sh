
# requires variables:
# AWS_PROFILE
# AWS_REGION
# AWS_SSO_SESSION

alias aws-ssh="ssh -i ~/.aws/ssh/ ~/.aws/pems"

alias aws-configure-sso='aws configure sso --output json --profile $AWS_PROFILE --region $AWS_REGION'

alias aws-login='aws sso login --sso-session $AWS_SSO_SESSION'

alias aws-logout='aws sso logout'

alias aws-caller-id='aws sts get-caller-identity --query "Account" --profile $AWS_PROFILE'

aws-is-login() {
    SSO_ACCOUNT=$(aws sts get-caller-identity --query "Account" --profile "$AWS_PROFILE")
    #you can add a better check, but this is just an idea for quick check
    if [ ${#SSO_ACCOUNT} -eq 14 ];  then
        echo "session still valid" ;
    else
        echo "Seems like session expired"
    # performed login here
fi
}

aws-cli() {
  aws $* --profile "$AWS_PROFILE"
}


aws-unset() {
    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_SESSION_TOKEN
}
