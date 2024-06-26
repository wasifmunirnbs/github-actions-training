provider "aws" {
  region = var.region
}

resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.cluster_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(var.tags, {
    Name = "${var.cluster_name}-subnet-group"
  })
}

resource "aws_elasticache_cluster" "memcached" {
  count = var.engine == "memcached" ? 1 : 0

  cluster_id           = var.cluster_name
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  subnet_group_name    = aws_elasticache_subnet_group.this.name
  security_group_ids   = var.security_group_ids

  maintenance_window = var.maintenance_window

  tags = merge(var.tags, {
    Name = var.cluster_name
  })
}

resource "aws_elasticache_replication_group" "redis" {
  count = var.engine == "redis" ? 1 : 0

  replication_group_id          = var.replication_group_id != "" ? var.replication_group_id : var.cluster_name
  node_type                     = var.node_type
  parameter_group_name          = var.parameter_group_name
  subnet_group_name             = aws_elasticache_subnet_group.this.name
  security_group_ids            = var.security_group_ids
  engine                        = var.engine
  engine_version                = var.engine_version
  automatic_failover_enabled    = var.automatic_failover_enabled

  maintenance_window        = var.maintenance_window
  snapshot_retention_limit  = var.snapshot_retention_limit
  snapshot_window           = var.snapshot_window

  tags = merge(var.tags, {
    Name = var.cluster_name
  })
}
