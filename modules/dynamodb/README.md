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
| [aws_dynamodb_table.basic-dynamodb-table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_mode"></a> [billing\_mode](#input\_billing\_mode) | Controls how you are billed for read and write throughput and how you manage capacity | `string` | `"PROVISIONED"` | no |
| <a name="input_global_secondary_indexes"></a> [global\_secondary\_indexes](#input\_global\_secondary\_indexes) | List of global secondary indexes for the table | <pre>list(object({<br>    name               = string<br>    hash_key           = string<br>    range_key          = string<br>    write_capacity     = number<br>    read_capacity      = number<br>    projection_type    = string<br>    non_key_attributes = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key) | Attribute to use as the hash (partition) key | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Unique name of the table | `string` | `null` | no |
| <a name="input_range_key"></a> [range\_key](#input\_range\_key) | Attribute to use as the range (sort) key | `string` | `null` | no |
| <a name="input_read_capacity"></a> [read\_capacity](#input\_read\_capacity) | Number of read units for this table | `number` | `1` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the table | `map(string)` | `{}` | no |
| <a name="input_ttl_attribute_name"></a> [ttl\_attribute\_name](#input\_ttl\_attribute\_name) | Name of the table attribute to store the TTL timestamp in | `string` | `""` | no |
| <a name="input_ttl_enabled"></a> [ttl\_enabled](#input\_ttl\_enabled) | Indicates whether TTL is enabled | `bool` | `false` | no |
| <a name="input_write_capacity"></a> [write\_capacity](#input\_write\_capacity) | Number of write units for this table | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_table_arn"></a> [table\_arn](#output\_table\_arn) | n/a |
| <a name="output_table_name"></a> [table\_name](#output\_table\_name) | n/a |
