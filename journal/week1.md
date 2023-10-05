# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure 

Our root module structure is as follows:

```
Project_ROOT
├── main.tf - everything else
├── variables.tf - stores the structure of input variables
├── terraform.tfvars - the data of variables we want to load into our terraform 
├── project providers.tf - defined required providers and their configs 
├── outputs.tf - stores our outputs
└── README.md - required for root modules
```
  
[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

### Terraform and Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### Terraform Cloud Variables


### Terraform Cloud Variables 

In terraform we can set two kinds of variables:
- Environment Variables - those you would set in your bash terminal
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so that are committed publicly in the UI. 

### Loadind Terraform Input Variables

We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_ud="my-user_id"`

### var-file flag 

-TODO: Document this flag

### terraform.tfvars

This is the default file to load in terraform variables in blank

### document this functionality for terraform cloud

### Order of terraform variables 

- TODO: Document which terrafrom variables take precedence. 

### Terraform Import 
[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)

### Dealing with Configuration Drift


### Fix manual configuration

### fIX manual configuration

If someone goes and deletes or modifies cloud resources manually through ClickOps. 

If we run `terraform plan`it will attempt to put our infr back into the expected state fixing configuration drift

### Terraform Modules

### Terraform Module Structure

It is recommended to place modules in a `modules` directory when locally developing modules but you can name it whatever you want. 

### Passing Input Variables 
We can pass input variables to our modules to our module

The module has to declare the terraform variables in its own variables.tf

``` tf
module "terrahouse" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  }
```

### Modules Sources

Using the source we can import the module from various places eg: 
- locally
- github 
- TF Registry

``` tf
module "terrahouse" {
  source = "./modules/terrahouse_aws"
  }
```

[Terraform Module Source] (https://developer.hashicorp.com/terraform/language/modules/sources)