module "elasticache" {
  source = "./elasticache"

  region                 = var.region
  cluster_name           = var.cluster_name
  engine                 = var.engine
  engine_version         = var.engine_version
  node_type              = var.node_type
  num_cache_nodes        = var.num_cache_nodes
  subnet_ids             = var.subnet_ids
  security_group_ids     = var.security_group_ids
  iam_instance_profile   = var.iam_instance_profile
  automatic_failover_enabled = var.automatic_failover_enabled
  maintenance_window     = var.maintenance_window
  snapshot_retention_limit = var.snapshot_retention_limit
  snapshot_window        = var.snapshot_window
  tags = {
    Environment = "dev"
    Project     = "Custom"
  }
}