variable "s3_bucket_name" {
  type        = string
  description = "Name of S3 remote state storage bucket"
}

variable "dynamodb_table_name" {
  type        = string
  description = "Name of DynamoDB remote state locking table"
  default     = "terraform-remote-state-lock"
}