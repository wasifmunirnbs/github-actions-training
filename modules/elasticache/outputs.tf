output "elasticache_cluster_id" {
  value       = aws_elasticache_cluster.memcached[0].id
  description = "The ID of the memcached cluster"
}

output "elasticache_cluster_address" {
  value       = aws_elasticache_cluster.memcached[0].cache_nodes[0].address
  description = "The address of the memcached cluster"
}

# output "elasticache_replication_group_id" {
#   value       = aws_elasticache_replication_group.redis[0].id
#   description = "The ID of the replication group"
# }

# output "elasticache_primary_endpoint_address" {
#   value       = aws_elasticache_replication_group.redis[0].primary_endpoint_address
#   description = "The address of the primary endpoint"
# }