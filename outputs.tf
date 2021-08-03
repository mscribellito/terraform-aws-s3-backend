output "state_storage" {
  description = "S3 remote state storage bucket"
  value       = aws_s3_bucket.state_storage
}

output "state_locking" {
  description = "DynamoDB remote state locking table"
  value       = aws_dynamodb_table.state_locking
}