output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.this.arn
}

output "log_bucket_id" {
  description = "ID of the log bucket"
  value       = var.enable_logging ? aws_s3_bucket.log_bucket[0].id : null
}

output "log_bucket_arn" {
  description = "ARN of the log bucket"
  value       = var.enable_logging ? aws_s3_bucket.log_bucket[0].arn : null
}