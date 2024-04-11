provider "aws" {
    region = "us-east-2"
    access_key = ""
    secret_key = ""
}
resource "aws_s3_bucket" "finance" {
    bucket = "finance-1234"
    tags = {
        Description = "finance and payroll"
    }
}
resource "aws_s3_bucket_object" "finance-2020" {
    content = "/home/ubuntu/finance-2020.doc"
    key = "finance-2020.doc"
    bucket = aws_s3_bucket.finance.id
}

resource "aws_s3_bucket_public_access_block" "example" {
    bucket = aws_s3_bucket.finance.id
  
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
  }
  
  resource "aws_s3_bucket_policy" "bucket_policy" {
    bucket = aws_s3_bucket.finance.id
  
    policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "PublicRead",
        "Effect": "Allow",
        "Principal": "*",
        "Action": ["s3:GetObject"],
        "Resource": "arn:aws:s3:::${aws_s3_bucket.finance.id}/*"
      }
    ]
  }
  EOF
  }
