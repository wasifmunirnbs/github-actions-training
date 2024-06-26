variable "name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the ALB should be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "create_security_group" {
  description = "Whether to create a security group for the ALB or not"
  type        = bool
  default     = true
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
  }))
  default = []
}

variable "access_logs_enabled" {
  description = "Whether to enable access logs for the ALB or not"
  type        = bool
  default     = false
}

variable "access_logs_bucket" {
  description = "Name of the S3 bucket for access logs"
  type        = string
  default     = null
}

variable "access_logs_prefix" {
  description = "Prefix for access logs in the S3 bucket"
  type        = string
  default     = null
}

variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection for the ALB or not"
  type        = bool
  default     = false
}

variable "target_groups" {
  description = "List of target group configurations"
  type = list(object({
    name          = string
    port          = number
    protocol      = string
    target_type   = string
    health_check  = object({
      path                = string
      healthy_threshold   = number
      unhealthy_threshold = number
      timeout             = number
      interval            = number
      matcher             = string
    })
  }))
  default = []
}

variable "listeners" {
  description = "List of listener configurations"
  type = list(object({
    port              = number
    protocol          = string
    target_group_index = number
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the ALB and related resources"
  type        = map(string)
  default     = {}
}

variable "existing_security_group_ids" {
  description = "List of existing security group IDs to use if not creating a new security group"
  type        = list(string)
  default     = []
}