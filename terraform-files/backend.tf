terraform {
  backend "s3" {
    bucket = "git-with-terraform"
    key = "terraform-file/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}