variable "name" {
  description = "Unique name of the table"
  type        = string
  default     = null
}

variable "billing_mode" {
  description = "Controls how you are billed for read and write throughput and how you manage capacity"
  type        = string
  default     = "PROVISIONED"
}

variable "read_capacity" {
  description = "Number of read units for this table"
  type        = number
  default     = 1
}

variable "write_capacity" {
  description = "Number of write units for this table"
  type        = number
  default     = 1
}

variable "hash_key" {
  description = "Attribute to use as the hash (partition) key"
  type        = string
  default     = null
}

variable "range_key" {
  description = "Attribute to use as the range (sort) key"
  type        = string
  default     = null
}

variable "ttl_enabled" {
  description = "Indicates whether TTL is enabled"
  type        = bool
  default     = false
}

variable "ttl_attribute_name" {
  description = "Name of the table attribute to store the TTL timestamp in"
  type        = string
  default     = ""
}

variable "global_secondary_indexes" {
  description = "List of global secondary indexes for the table"
  type        = list(object({
    name               = string
    hash_key           = string
    range_key          = string
    write_capacity     = number
    read_capacity      = number
    projection_type    = string
    non_key_attributes = list(string)
  }))
  default     = []
}

variable "tags" {
  description = "A map of tags to add to the table"
  type        = map(string)
  default     = {}
}
