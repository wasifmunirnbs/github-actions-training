resource "aws_s3_bucket" "lambda_bucket" {
  count  = var.create_package && var.s3_bucket != null ? 1 : 0
  bucket = var.s3_bucket
}

resource "aws_s3_bucket_ownership_controls" "lambda_bucket" {
  count  = var.create_package && var.s3_bucket != null ? 1 : 0
  bucket = aws_s3_bucket.lambda_bucket[0].id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "lambda_bucket" {
  count  = var.create_package && var.s3_bucket != null ? 1 : 0
  bucket = aws_s3_bucket.lambda_bucket[0].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "archive_file" "lambda_package" {
  count       = var.create_package && var.source_path != null ? 1 : 0
  type        = "zip"
  source_file  = var.source_path
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_s3_object" "lambda_package" {
  count  = var.create_package && var.source_path != null ? 1 : 0
  bucket = var.s3_bucket
  key    = "lambda_function_${data.archive_file.lambda_package[0].output_md5}.zip"
  source = data.archive_file.lambda_package[0].output_path
  etag   = filemd5(data.archive_file.lambda_package[0].output_path)
  depends_on = [aws_s3_bucket.lambda_bucket]
}

locals {
  s3_bucket         = var.create_package ? var.s3_bucket : (var.s3_existing_package != null ? var.s3_existing_package.bucket : null)
  s3_key            = var.create_package ? aws_s3_object.lambda_package[0].key : (var.s3_existing_package != null ? var.s3_existing_package.key : null)
  s3_object_version = var.s3_existing_package != null ? var.s3_existing_package.version : null
  filename          = var.local_existing_package
}