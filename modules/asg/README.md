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
| [aws_autoscaling_group.autoscaling_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_launch_template.autoscaling_launch_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | Desired capacity of the autoscaling group | `number` | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | ID of the AMI to use for the launch template | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type to use for the launch template | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the key pair to use for the launch template | `string` | `null` | no |
| <a name="input_launch_template_name_prefix"></a> [launch\_template\_name\_prefix](#input\_launch\_template\_name\_prefix) | Name prefix of the launch template | `string` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum size of the autoscaling group | `number` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum size of the autoscaling group | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the autoscaling group | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs to associate with instances | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to apply to the launch template | `map(string)` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data script for the launch template | `string` | `null` | no |
| <a name="input_vpc_zone_identifier"></a> [vpc\_zone\_identifier](#input\_vpc\_zone\_identifier) | List of subnet IDs to launch resources in | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscaling_group_arn"></a> [autoscaling\_group\_arn](#output\_autoscaling\_group\_arn) | ARN of the autoscaling group |
| <a name="output_autoscaling_group_id"></a> [autoscaling\_group\_id](#output\_autoscaling\_group\_id) | ID of the autoscaling group |
| <a name="output_autoscaling_group_name"></a> [autoscaling\_group\_name](#output\_autoscaling\_group\_name) | Name of the autoscaling group |
