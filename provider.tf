//aws provider declaration. Terraform is using the connection iformation I used in AWS CLI setup
//more info about AWS connection is available in terraform offical doc
provider "aws" {
  region = var.region
}