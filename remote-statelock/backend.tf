terraform {
    backend "s3" {
        bucket = "shs-terraform-s3-bucket"
        key    = "shs/terraform.tfstate"
        region     = "us-east-2"
        encrypt        = true
        dynamodb_table = "dynamodb-state-locking"
    }
}
