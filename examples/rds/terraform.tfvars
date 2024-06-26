db_parameter_group_family = "mysql8.0"

db_parameters = [
  {
    name  = "max_connections"
    value = "150"
  },
  {
    name  = "innodb_buffer_pool_size"
    value = "2147483648"
  }
]

inbound_rules = [
  {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

outbound_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

subnet_ids = ["subnet-065be8e369d129e03", "subnet-052c9a52d952d085a"]

vpc_id                  = "vpc-0ad6d2ec9d5f62ac6"
db_instance_class       = "db.t3.medium"
allocated_storage       = 20
engine                  = "mysql"
engine_version          = "8.0"
username                = "admin"
password                = "password"
backup_retention_period = 7
skip_final_snapshot     = true 