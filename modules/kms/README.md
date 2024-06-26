## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | AWS account ID | `string` | n/a | yes |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | Number of days before KMS key deletion | `number` | `10` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the KMS key | `string` | `"KMS key with conditional policies per service"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to create the KMS key in | `string` | `"us-east-1"` | no |
| <a name="input_services"></a> [services](#input\_services) | List of AWS services allowed to use the KMS key | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | ID of the created KMS key |
