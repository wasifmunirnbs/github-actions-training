output "queue_id" {
  description = "The ID of the SQS queue"
  value       = aws_sqs_queue.sqs.id
}

output "queue_arn" {
  description = "The ARN of the SQS queue"
  value       = aws_sqs_queue.sqs.arn
}

output "queue_url" {
  description = "The URL of the SQS queue"
  value       = aws_sqs_queue.sqs.url
}

output "policy_arn" {
  description = "The ARN of the IAM policy for the SQS queue"
  value       = aws_iam_policy.sqs_policy.arn
}
