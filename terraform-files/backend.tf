terraform {
  backend "s3" {
    bucket = "git with terraform"
    key = "terraform-file/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    dynamodb_table = "terraform-lock-table"
  }

}