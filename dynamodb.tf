resource "aws_dynamodb_table" "state_locking" {

  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = local.hash_key_lock_id

  attribute {
    name = local.hash_key_lock_id
    type = "S"
  }

}