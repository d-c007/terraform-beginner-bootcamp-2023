# Terraform Beginner Bootcamp 2023

##This project is going to utilize semantic versioning for its tagging 
[semver.org] (https://semver.org/)

The general format:

**MAJOR** version when you make incompatible API changes
**MINOR** version when you make functionality changes in a backward compatible manner
**PATCH** versions when you make backward compatible fixes

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
### References

https://quickref.me/chmod.html
https://www.gitpod.io/docs/configure/workspaces/tasks