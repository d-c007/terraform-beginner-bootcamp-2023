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

### References

https://quickref.me/chmod.html
https://www.gitpod.io/docs/configure/workspaces/tasks