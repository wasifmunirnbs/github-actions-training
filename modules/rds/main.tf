resource "aws_db_parameter_group" "custom" {
  name        = var.db_parameter_group_name
  family      = var.db_parameter_group_family
  description = "Custom parameter group for RDS"

  dynamic "parameter" {
    for_each = var.db_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}

resource "aws_db_subnet_group" "custom" {
  name        = var.db_subnet_group_name
  description = "Custom subnet group for RDS"
  subnet_ids  = var.subnet_ids
}

resource "aws_security_group" "custom" {
  name        = var.db_security_group_name
  description = "Custom security group for RDS"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.inbound_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.outbound_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}

resource "aws_db_instance" "custom" {
  identifier              = var.db_instance_name
  instance_class          = var.db_instance_class
  allocated_storage       = var.allocated_storage
  engine                  = var.engine
  engine_version          = var.engine_version
  username                = var.username
  password                = var.password
  parameter_group_name    = aws_db_parameter_group.custom.name
  db_subnet_group_name    = aws_db_subnet_group.custom.name
  vpc_security_group_ids  = [aws_security_group.custom.id]
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = var.skip_final_snapshot
}
