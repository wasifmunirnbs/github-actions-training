variable "region" {
  description = "The AWS region to create the KMS key in"
  type        = string
  default     = "us-east-1"
}

variable "description" {
  description = "Description of the KMS key"
  type        = string
  default     = "KMS key with conditional policies per service"
}

variable "deletion_window_in_days" {
  description = "Number of days before KMS key deletion"
  type        = number
  default     = 10
}

variable "account_id" {
  description = "AWS account ID"
  type        = string
}

variable "service_principle" {
  description = "List of AWS services allowed to use the KMS key"
  type        = list(string)
}
