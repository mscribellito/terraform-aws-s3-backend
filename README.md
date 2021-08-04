# terraform-aws-s3-backend

A Terraform module to configure remote state storage and locking using S3 and DynamoDB.

[Terraform Registry](https://registry.terraform.io/modules/mscribellito/s3-backend/aws/latest)

## Usage

```hcl
module "s3-backend" {
  source         = "mscribellito/s3-backend/aws"
  s3_bucket_name = "mybucket"
}
```

Once the resources are create, you can configure your terraform backend.

```hcl
terraform {
  backend "s3" {
    bucket         = "mybucket"
    key            = "path/to/my/key"
    region         = "us-east-1"
    dynamodb_table = "terraform-remote-state-lock"
    encrypt        = true
  }
}
```

### Resources

| Name | Resource |
| ---- | -------- |
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_dynamodb_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

### Inputs

| Name | Description | Type | Default |
| ---- | ----------- | ---- | ------- |
| s3_bucket_name | Name of S3 remote state storage bucket | `string` | N/A |
| dynamodb_table_name | Name of DynamoDB remote state locking table | `string` | `terraform-remote-state-lock` |

### Outputs

| Name | Description |
| ---- | ----------- |
| state_storage | S3 remote state storage bucket |
| state_locking | DynamoDB remote state locking table |

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
