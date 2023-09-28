# Terraform Beginner Bootcamp 2023

##This project is going to utilize semantic versioning for its tagging 
[semver.org] (https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1` 

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you make functionality changes in a backward compatible manner
- **PATCH** versions when you make backward compatible fixes

### Considerations for Linux Distro

```gitpod /etc $ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Install the Terraform CLI 

The Terraform CLI Instructions have changed due to do gpg keyrings changes. So we needed refer to the latest install instructions via Terraform Documentation and change the scripting for install

[Install Terraform CLI] (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg decprecation issues we noticed that bash scripts steps were a considerable amount more code. So we decided to  create a bash script to install Terraform.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

- This will keep the Gitpod Task File ([.gitpod.yml]) tidy.
- This allows us an easier to debug and execute manually.
- This will allow better portability for other porjects that need to install Terraform via CLI
Recommend using this when formatting bash scripts`#!/usr/bin/env bash`

When executing the bash script we can use the `./` shorthand notation to execute the bash script

The bash scripts needs execution privileges before you can run it.

### Working Env Vars

We can list out all Enviroment Variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_`

### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO= 'world`

In the terminal we can unset using `unset HELLO`

```SH
HELLO=`world` ./bin/print_message
```

Within a bash script  we can set env without writing export eg. 

```sh
#!/usr/bin/env bash

HELLO=`world`

echo  $HELLO
```

## Printing Vars

We can print an en var using echo eg. `echo $HELLO`

## Scoping of Env Vars 

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window

If you want Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile eg. `.bash_profile`

### Persisting En Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO`world`
```

All future workspaces launched will set the env vars for all bash termnals opened in those workspaces.

You can also set en vars in the `.gitpod.yml` but this can only contain non sensitive  env vars

### AWS CLI Installation

AWS CLI is installed for this project via the bash script  [`./bin/install_aws_cli`] (./bin/install)

We can check if our AWS configured credentials are configured by running the following AWS CLI command:
``` sh
aws sts get-caller-identity 
```

If it is succesful you should see a json payload return that loos like this:

```json
{
    "UserId": "AIZAYDME2EULCI4GT36XBD",
    "Account": "163489712549",
    "Arn": "arn:aws:iam::123456789101112:user/terraform_beginner-bootcamp
}
```
[AWS CLI env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

## Terraform Registry 

Terraform sources their providers and modules from the Terraform registery which is located at [registery.teraform.io] (https://registry.terraform.io/) 

- **Terraform providers** - is an interface to APIs that will allow you to create resources in terraform. (https://registry.terraform.io/browse/providers)
- **Terraform modules** - are a way to make large amount of teraform code modular, portable, and re-usable. (https://registry.terraform.io/browse/modules) 

## Terraform Console

We can see a list of all the Terraform commans by simply typing `terraform`

### Terraform Init

At the start of a new terraform project we will run `terraform init` to download binaries for terraform providers that we'll use in this project 

### Terraform Plan

`terraform plan`

This will generate out a changeset, about the state of our infrastructure and what will be changed.

We can output this change ie. "plan" to be passed to an apply, but often you can just ignore output

### Terraform Apply

`terraform apply`

This will run a plan and pass the changes to be executed by terraform. Apply should prompt yes or no.

If we want to automatically approve an apply we can provide the `terraform apply --auto approve` flag

### Terraform Lock Files
`terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project 

The Terraform Lock File **should be committed** to your VCS eg. Github

### Terraform State Files

`terraform.tfstate` contains information about the current state of your infrastructure
This file **should not be committed** to your VCS. This file can contain sensitive data 

If you lose this file, you lose knowing the state of your infrastructure. 
`terraform.tfstate.backup` is the previous state file state

### Terraform Directory

`.terraform` directory contains binaries of terraform providers. 
### References

https://quickref.me/chmod.html
https://www.gitpod.io/docs/configure/workspaces/tasks
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
