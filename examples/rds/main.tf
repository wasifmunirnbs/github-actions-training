provider "aws" {
  region  = "us-east-1"
  profile = "default"
}


module "rds_setup" {
  source = "./rds" 
  db_parameter_group_name   = var.db_parameter_group_name
  db_security_group_name    = var.db_security_group_name
  db_subnet_group_name      = var.db_subnet_group_name
  db_instance_name          = var.db_instance_name
  allocated_storage         =  var.allocated_storage
  db_instance_class         =  var.db_instance_class
  backup_retention_period   = var.backup_retention_period
  engine                    = var.engine
  engine_version            = var.engine_version
  username                  = var.username
  password                  = var.password
  skip_final_snapshot       = var.skip_final_snapshot
 
  db_parameter_group_family = var.db_parameter_group_family
  db_parameters             = var.db_parameters
  subnet_ids                = var.subnet_ids
  vpc_id                    = var.vpc_id
  inbound_rules             = var.inbound_rules
  outbound_rules            = var.outbound_rules
}



