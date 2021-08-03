locals {

  # https://www.terraform.io/docs/language/settings/backends/s3.html#dynamodb-state-locking
  hash_key_lock_id = "LockID"

}

resource "aws_s3_bucket" "state_storage" {

  bucket = var.s3_bucket_name
  acl    = "private"

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }

  # Enable versioning so we can see the full revision history of our state files
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

}