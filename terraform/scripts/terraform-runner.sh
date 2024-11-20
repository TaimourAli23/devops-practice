creds=$(aws sts assume-role --role-arn arn:aws:iam::604977880911:role/devops --role-session-name mySession --serial-number arn:aws:iam::486807960363:mfa/cli-mfa-app --token-code 237628)
export AWS_ACCESS_KEY_ID=$(echo $creds | jq -r '.Credentials.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(echo $creds | jq -r '.Credentials.SecretAccessKey')
export AWS_SESSION_TOKEN=$(echo $creds | jq -r '.Credentials.SessionToken')
terraform apply
