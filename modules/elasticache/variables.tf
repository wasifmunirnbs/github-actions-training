variable "region" {
  description = "The AWS region to deploy the resources in"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "The name of the Elasticache cluster"
  type        = string
}

variable "engine" {
  description = "The Elasticache engine to use, either redis or memcached"
  type        = string
  default     = "memcached" #redis
}

variable "engine_version" {
  description = "The version of the Elasticache engine"
  type        = string
  default     = "1.5.16" #6.x
}

variable "node_type" {
  description = "The instance class for the Elasticache nodes"
  type        = string
  default     = "cache.t3.micro"
}

variable "num_cache_nodes" {
  description = "The number of cache nodes (for memcached) or number of replicas (for redis)"
  type        = number
  default     = 1
}

variable "replication_group_id" {
  description = "The replication group identifier (only for redis)"
  type        = string
  default     = ""
}

variable "parameter_group_name" {
  description = "The name of the parameter group to associate with the cache cluster"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "List of subnet IDs for the cache subnet group"
  type        = list(string)
  default = [ "subnet-0b61aa1ee29dc88bb", "subnet-06a00fc1e8301379d" ]
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the Elasticache cluster"
  type        = list(string)
  default = [ "sg-067a85f23eb1ac35e", "sg-0de63c3aff5174878" ]
}

variable "automatic_failover_enabled" {
  description = "Specifies whether a read replica is automatically promoted to read/write primary if the existing primary fails (only for redis)"
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "Specifies the weekly time range for maintenance"
  type        = string
  default     = "sun:05:00-sun:09:00"
}

variable "snapshot_retention_limit" {
  description = "The number of days to retain snapshots"
  type        = number
  default     = 0
}

variable "snapshot_window" {
  description = "The daily time range (in UTC) during which snapshots are taken"
  type        = string
  default     = "05:00-09:00"
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
