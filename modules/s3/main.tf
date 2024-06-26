# # # Bucket ACL
# # resource "aws_s3_bucket_acl" "this" {
# #   bucket = aws_s3_bucket.this.id
# #   acl    = var.acl
# # }

# Create S3 bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

# Bucket Versioning
resource "aws_s3_bucket_versioning" "this" {
  count  = var.enable_versioning ? 1 : 0
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Log Bucket
resource "aws_s3_bucket" "log_bucket" {
  count  = var.enable_logging ? 1 : 0
  bucket = var.log_bucket_name
}

# Bucket Logging
resource "aws_s3_bucket_logging" "this" {
  count         = var.enable_logging ? 1 : 0
  bucket        = aws_s3_bucket.this.id
  target_bucket = aws_s3_bucket.log_bucket[0].id
  target_prefix = var.log_prefix

  depends_on = [
    aws_s3_bucket.log_bucket
  ]
}

# Server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  count  = var.enable_encryption ? 1 : 0
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.kms_key_id != "" ? var.kms_key_id : null
    }
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.this.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.this.id
  acl    = var.acl
}
