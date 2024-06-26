variable "name" {
  description = "Name of the WAF Web ACL"
  type        = string
}

variable "description" {
  description = "Description of the WAF Web ACL"
  type        = string
  default     = "WAF Web ACL"
}

variable "scope" {
  description = "Scope of the WAF Web ACL (REGIONAL or CLOUDFRONT)"
  type        = string
  default     = "REGIONAL"
}

variable "rules" {
  description = "List of WAF rules"
  type = list(object({
    name        = string
    priority    = number
    action      = string
    type        = string
    ip_set_arn  = optional(string)
    managed_rule_group_name = optional(string)
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the WAF Web ACL"
  type        = map(string)
  default     = {}
}

variable "associate_alb" {
  description = "Whether to associate the WAF with an ALB"
  type        = bool
  default     = false
}

variable "alb_arn" {
  description = "ARN of the ALB to associate with the WAF"
  type        = string
  default     = ""
}