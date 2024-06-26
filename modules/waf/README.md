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
| [aws_wafv2_web_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) | resource |
| [aws_wafv2_web_acl_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_arn"></a> [alb\_arn](#input\_alb\_arn) | ARN of the ALB to associate with the WAF | `string` | `""` | no |
| <a name="input_associate_alb"></a> [associate\_alb](#input\_associate\_alb) | Whether to associate the WAF with an ALB | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the WAF Web ACL | `string` | `"WAF Web ACL"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the WAF Web ACL | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | List of WAF rules | <pre>list(object({<br>    name        = string<br>    priority    = number<br>    action      = string<br>    type        = string<br>    ip_set_arn  = optional(string)<br>    managed_rule_group_name = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_scope"></a> [scope](#input\_scope) | Scope of the WAF Web ACL (REGIONAL or CLOUDFRONT) | `string` | `"REGIONAL"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the WAF Web ACL | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_web_acl_arn"></a> [web\_acl\_arn](#output\_web\_acl\_arn) | ARN of the WAF Web ACL |
| <a name="output_web_acl_id"></a> [web\_acl\_id](#output\_web\_acl\_id) | ID of the WAF Web ACL |
<!-- END_TF_DOCS -->