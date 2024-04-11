provider "aws" {
    region = "us-east-2"
    access_key = ""
    secret_key = ""
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "dynamodb-state-locking"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "shs-terraform-s3-bucket"
}
