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
| [aws_iam_policy.sqs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_sqs_queue.sqs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.sqs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dead_letter_target_arn"></a> [dead\_letter\_target\_arn](#input\_dead\_letter\_target\_arn) | The ARN of the dead letter queue to which Amazon SQS moves messages after the value of maxReceiveCount is exceeded | `string` | `""` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | The time in seconds that the delivery of all messages in the queue will be delayed | `number` | `0` | no |
| <a name="input_enable_redrive_policy"></a> [enable\_redrive\_policy](#input\_enable\_redrive\_policy) | Boolean to enable redrive policy | `bool` | `false` | no |
| <a name="input_enable_sse_kms"></a> [enable\_sse\_kms](#input\_enable\_sse\_kms) | Boolean to enable KMS-managed server-side encryption (SSE-KMS) | `bool` | `false` | no |
| <a name="input_enable_sse_sqs"></a> [enable\_sse\_sqs](#input\_enable\_sse\_sqs) | Boolean to enable SQS-managed server-side encryption (SSE-SQS) | `bool` | `false` | no |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | Boolean designating a FIFO queue | `bool` | `false` | no |
| <a name="input_kms_data_key_reuse_period_seconds"></a> [kms\_data\_key\_reuse\_period\_seconds](#input\_kms\_data\_key\_reuse\_period\_seconds) | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling KMS again. | `number` | `300` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK. | `string` | `""` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | The limit of how many bytes a message can contain before Amazon SQS rejects it | `number` | `262144` | no |
| <a name="input_max_receive_count"></a> [max\_receive\_count](#input\_max\_receive\_count) | The number of times a message is delivered to the source queue before being moved to the dead letter queue | `number` | `5` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | The number of seconds Amazon SQS retains a message | `number` | `345600` | no |
| <a name="input_policy_condition"></a> [policy\_condition](#input\_policy\_condition) | Condition for SQS policy, e.g., 'StringEquals', 'StringLike', etc. | `string` | `"ArnEquals"` | no |
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | The name of the SQS queue | `string` | n/a | yes |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | The time for which a ReceiveMessage call will wait for a message to arrive | `number` | `0` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the queue | `map(string)` | `{}` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | The visibility timeout for the queue | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | The ARN of the IAM policy for the SQS queue |
| <a name="output_queue_arn"></a> [queue\_arn](#output\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_queue_id"></a> [queue\_id](#output\_queue\_id) | The ID of the SQS queue |
| <a name="output_queue_url"></a> [queue\_url](#output\_queue\_url) | The URL of the SQS queue |
