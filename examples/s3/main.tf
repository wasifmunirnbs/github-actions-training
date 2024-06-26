module "s3_bucket" {
  source = "../../modules/s3"

  bucket_name       = "ahmeds-module-bucket"
  log_bucket_name   = "ahmeds-log-bucket-name"
  log_prefix        = "logs/" # Update with the desired prefix
  enable_versioning = true   # Set to true or false
  enable_logging    = true   # Set to true or false
  enable_encryption = true    # Set to true or false
  sse_algorithm     = "AES256"
  kms_key_id        = "" # Leave empty for AWS-managed keys, or provide a KMS Key ID
  acl = "private"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}