variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "log_bucket_name" {
  description = "Name of the log bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Whether to enable versioning for the S3 bucket"
  type        = bool
  default     = false
}

variable "enable_logging" {
  description = "Whether to enable logging for the S3 bucket"
  type        = bool
  default     = false
}

variable "enable_encryption" {
  description = "Whether to enable server-side encryption for the S3 bucket"
  type        = bool
  default     = false
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use for the bucket"
  type        = string
  default     = "AES256"
}

variable "kms_key_id" {
  description = "KMS Key ID to use for server-side encryption (leave empty to use AWS-managed keys)"
  type        = string
  default     = ""
}

variable "log_prefix" {
  description = "Prefix for the log files"
  type        = string
  default     = "logs/"
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "acl" {
  description = "The canned ACL to apply. e.g. 'private', 'public-read', 'public-read-write', 'authenticated-read'"
  type        = string
  default     = "private"
}
