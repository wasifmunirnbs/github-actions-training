variable "db_parameter_group_name"{
  description = "DB parameter group name"
  type = string 
}
variable "db_security_group_name" {
  description = "RDS Custom Security Group name"
  type = string
}
variable "db_subnet_group_name"{
  description = "Subnet group for DBs"
  type        = string 
}
variable "db_instance_name" {
  description = "Name of DB Instance"
  type        = string
}
variable "db_parameter_group_family" {
  description = "DB parameter group family"
  type        = string
}

variable "db_parameters" {
  description = "List of DB parameters"
  type        = list(object({
    name  = string
    value = string
  }))
    default = [
  {
    name  = "max_connections"
    value = "150"
  },
  {
    name  = "innodb_buffer_pool_size"
    value = "2147483648"
  }
 ]
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "inbound_rules" {
  description = "List of inbound rules"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "outbound_rules" {
  description = "List of outbound rules"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "db_instance_class" {
  description = "The instance class of the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
}

variable "username" {
  description = "The master username for the database"
  type        = string
}

variable "password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
} 

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
}