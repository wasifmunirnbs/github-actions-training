<!-- BEGIN_TF_DOCS -->
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
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs_bucket"></a> [access\_logs\_bucket](#input\_access\_logs\_bucket) | Name of the S3 bucket for access logs | `string` | `null` | no |
| <a name="input_access_logs_enabled"></a> [access\_logs\_enabled](#input\_access\_logs\_enabled) | Whether to enable access logs for the ALB or not | `bool` | `false` | no |
| <a name="input_access_logs_prefix"></a> [access\_logs\_prefix](#input\_access\_logs\_prefix) | Prefix for access logs in the S3 bucket | `string` | `null` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Whether to create a security group for the ALB or not | `bool` | `true` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | Whether to enable deletion protection for the ALB or not | `bool` | `false` | no |
| <a name="input_existing_security_group_ids"></a> [existing\_security\_group\_ids](#input\_existing\_security\_group\_ids) | List of existing security group IDs to use if not creating a new security group | `list(string)` | `[]` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of ingress rules for the security group | <pre>list(object({<br>    from_port        = number<br>    to_port          = number<br>    protocol         = string<br>    cidr_blocks      = list(string)<br>    ipv6_cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_listeners"></a> [listeners](#input\_listeners) | List of listener configurations | <pre>list(object({<br>    port              = number<br>    protocol          = string<br>    target_group_index = number<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Application Load Balancer | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the ALB | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the ALB and related resources | `map(string)` | `{}` | no |
| <a name="input_target_groups"></a> [target\_groups](#input\_target\_groups) | List of target group configurations | <pre>list(object({<br>    name          = string<br>    port          = number<br>    protocol      = string<br>    target_type   = string<br>    health_check  = object({<br>      path                = string<br>      healthy_threshold   = number<br>      unhealthy_threshold = number<br>      timeout             = number<br>      interval            = number<br>      matcher             = string<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where the ALB should be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_arn"></a> [alb\_arn](#output\_alb\_arn) | ARN of the Application Load Balancer |
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | DNS name of the Application Load Balancer |
| <a name="output_target_group_arns"></a> [target\_group\_arns](#output\_target\_group\_arns) | ARNs of the target groups |
<!-- END_TF_DOCS -->