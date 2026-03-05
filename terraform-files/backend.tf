terraform {
  backend "s3" {
    bucket = "git_with_terraform"
    key = "terraform-file/terraform.tfstate"
    region = "ap-south-1"
  }
}