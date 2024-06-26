variable "name" {
  description = "Name of the autoscaling group"
  type        = string
}

variable "min_size" {
  description = "Minimum size of the autoscaling group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the autoscaling group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired capacity of the autoscaling group"
  type        = number
}

variable "vpc_zone_identifier" {
  description = "List of subnet IDs to launch resources in"
  type        = list(string)
}

variable "launch_template_name_prefix" {
  description = "Name prefix of the launch template"
  type        = string
}

variable "image_id" {
  description = "ID of the AMI to use for the launch template"
  type        = string
}

variable "instance_type" {
  description = "Instance type to use for the launch template"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair to use for the launch template"
  type        = string
  default       = null
}

variable "user_data" {
  description = "User data script for the launch template"
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with instances"
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "Map of tags to apply to the launch template"
  type        = map(string)
}
