provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "harper-terraform-up-and-running-state"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "terraform_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_bucket_encryption" {
  bucket = aws_s3_bucket.terraform_state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  hash_key     = "LockID"
  name         = "terraform-running-state-locks"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}



# terraform {
#   backend "s3" {
#     bucket = "harper-terraform-up-and-running-state"
#     key    = "global/s3/terraform.tfstate"
#     region = "ap-southeast-2"
#     dynamodb_table = "terraform-running-state-locks"
#     encrypt = true
#   }
# }
