provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "git-with-terraform"

  tags = {
    Name        = "git-with-terraform"

  }
}