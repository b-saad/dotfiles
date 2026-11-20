export GOPATH=$HOME/go
export GOROOT="/opt/homebrew/opt/go/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin:/Users/bsaad/Library/Python/3.9/bin"
export GOPRIVATE="cd.splunkdev.com"
export GOPROXY="https://repo.splunkdev.net/artifactory/api/go/go"
export OKTA_MFA_OPTION=push

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# -- Work Aliases --
alias std_okta='eval $(okta-aws-login)'
alias gov_okta_stg='eval $(okta-aws-login -a il2stg)'
alias fed_okta_stg='eval $(okta-aws-login -a il5stg)'
alias k='kubectl'

# -- AWS Profiles --
alias aws-profiles='command aws configure list-profiles'
alias aws-selected='command aws --profile "$(aws-current)"'

alias aws-core-dev='aws-use splunkcloud-cworks-core-dev_admin'
alias aws-core-stg='aws-use splunkcloud-cworks-core-stg_admin'
alias aws-core-lve='aws-use splunkcloud-cworks-core-lve_admin'
alias aws-core-gov-stg='aws-use splunkcloud-cworks-core-gov-stg_admin'
alias aws-core-fed-stg='aws-use splunkcloud-cworks-core-fed-stg_admin'

alias aws-k8s-dev='aws-use splunk-ccp-k8s-playground_power'
alias aws-k8s-stg='aws-use splunk-ccp-k8s-staging_power'
alias aws-k8s-lve='aws-use splunk-ccp-k8s-production_splkcld_account_power'
alias aws-k8s-gov-stg='aws-use splunk-k8s-gov-stg_power'
alias aws-k8s-fed-stg='aws-use splunk-k8s-fhi-stg1_power'

aws-current() {
  print -r -- "${AWS_DEFAULT_PROFILE:-${AWS_PROFILE:-default}}"
}

aws-use() {
  if (( $# != 1 )); then
    print -u2 'Usage: aws-use <profile>'
    return 2
  fi

  local configured_profiles
  configured_profiles=$(command aws configure list-profiles) || return
  local -a profiles
  profiles=("${(@f)configured_profiles}")

  if [[ -z $1 ]] || (( ! ${profiles[(Ie)$1]} )); then
    print -ru2 -- "Unknown AWS profile: $1. Run aws-profiles to list configured profiles."
    return 1
  fi

  unset AWS_DEFAULT_PROFILE
  export AWS_PROFILE="$1"
  aws-current
}

cleanLocalCO2() {
  branch=$(git rev-parse --abbrev-ref HEAD)
  echo "resetting to $branch"
  rm -rf ./deploy/terraform && git checkout "$branch" -- deploy/terraform
}

vault-login() {
        echo "1. STD Dev"
        echo "2. STD Stg pdx10"
        echo "3. STD Stg iad10"
        echo "4. STD Prod"
        echo "5. IL2 Stg"
        echo "6. IL2 Prod"
        echo "7. IL5 Stg"
        echo "8. IL5 Prod"
        echo "9. STD CICD"
        echo "10. Exit"
        local choice
        echo "Enter choice [ 1 - 10]? "
        read choice
        case $choice in
          1) export VAULT_ADDR="https://cluster-01-pdx10.stage.vault.splunkcloud.systems" && vault login -method=oidc;;
          2) export VAULT_ADDR="https://cluster-01-pdx10.stage.vault.splunkcloud.systems" && vault login -method=oidc;;
          3) export VAULT_ADDR="https://cluster-01-iad10.stage.vault.splunkcloud.systems" && vault login -method=oidc;;
          4) export VAULT_ADDR="https://cluster-01-pdx10.prod.vault.splunkcloud.systems" && vault login -method=oidc;;
          5) export VAULT_ADDR="https://protected.cluster-01-sjc11.vault.stg.splunk8sdc.net" && vault login -method=oidc;;
          6) export VAULT_ADDR="https://cluster-01-sjc11.vault.splunkgovcloud.systems" && vault login -method=oidc;;
          7) export VAULT_ADDR="https://cluster-01-sjc12.stage.vault.splunkcloudfed.systems" && vault login -method=oidc;;
          8) export VAULT_ADDR="https://cluster-01-sjc12.vault.splunkcloudfed.systems" && vault login -method=oidc;;
          9) export VAULT_ADDR="https://cluster-cicd-01-pdx10.prod.vault.splunkdev.com" && vault login -method=oidc;;
          10) exit 0;;
          *) echo -e "${RED}Error...${STD}" && sleep 2
        esac
}

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# claude binary lives here
export PATH="$HOME/.local/bin:$PATH"
