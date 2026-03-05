provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "git_with_terraform"

  tags = {
    Name        = "git_with_terraform"

  }
}