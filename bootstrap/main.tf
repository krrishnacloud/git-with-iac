provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "git-with-terraform"

  tags = {
    Name        = "git-with-terraform"

  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}