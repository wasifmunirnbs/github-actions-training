output "kms_key_id" {
  description = "ID of the created KMS key"
  value       = aws_kms_key.kms.id
}
