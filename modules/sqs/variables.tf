variable "queue_name" {
  description = "The name of the SQS queue"
  type        = string
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed"
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message"
  type        = number
  default     = 345600
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive"
  type        = number
  default     = 0
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue"
  type        = number
  default     = 30
}

variable "fifo_queue" {
  description = "Boolean designating a FIFO queue"
  type        = bool
  default     = false
}

variable "enable_redrive_policy" {
  description = "Boolean to enable redrive policy"
  type        = bool
  default     = false
}

variable "dead_letter_target_arn" {
  description = "The ARN of the dead letter queue to which Amazon SQS moves messages after the value of maxReceiveCount is exceeded"
  type        = string
  default     = ""
}

variable "max_receive_count" {
  description = "The number of times a message is delivered to the source queue before being moved to the dead letter queue"
  type        = number
  default     = 5
}

variable "tags" {
  description = "A mapping of tags to assign to the queue"
  type        = map(string)
  default     = {}
}

variable "enable_sse_sqs" {
  description = "Boolean to enable SQS-managed server-side encryption (SSE-SQS)"
  type        = bool
  default     = false
}

variable "enable_sse_kms" {
  description = "Boolean to enable KMS-managed server-side encryption (SSE-KMS)"
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK."
  type        = string
  default     = ""
}

variable "kms_data_key_reuse_period_seconds" {
  description = "The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling KMS again."
  type        = number
  default     = 300
}

variable "policy_condition" {
  description = "Condition for SQS policy, e.g., 'StringEquals', 'StringLike', etc."
  type        = string
  default     = "ArnEquals"
}
