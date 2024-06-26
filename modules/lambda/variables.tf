variable "create_package" {
  description = "Whether to create a package and upload to S3"
  type        = bool
  default     = true
}

variable "local_existing_package" {
  description = "The absolute path to an existing zip-file to use"
  type        = string
  default     = null
}

variable "s3_existing_package" {
  description = "The S3 bucket object with keys bucket, key, version pointing to an existing zip-file to use"
  type = object({
    bucket  = string
    key     = string
    version = optional(string)
  })
  default = null
}

variable "s3_bucket" {
  description = "S3 bucket to store the Lambda package"
  type        = string
  default     = null
}

variable "source_path" {
  description = "The absolute path to a local file or directory containing your Lambda source code"
  type        = string
  default     = null
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
}

variable "runtime" {
  description = "Lambda function runtime"
  type        = string
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda function can use at runtime"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Amount of time your Lambda function has to run in seconds"
  type        = number
  default     = 3
}

variable "environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to Lambda function"
  type        = map(string)
  default     = {}
}

variable "log_retention_in_days" {
  description = "Specifies the number of days you want to retain log events"
  type        = number
  default     = 14
}