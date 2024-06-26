# ElastiCache Module for NBS

This repository contains a Terraform module for provisioning and managing AWS ElastiCache clusters, including related resources such as DB subnet groups, security groups, and parameter groups.

## Description

This module provides a customizable and reusable setup for creating AWS ElastiCache clusters, making it easy to deploy and manage databases with specific configurations for different environments. It supports various database engines and versions and includes options for setting up security groups, parameter groups, and subnet groups.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v0.12+
- AWS CLI configured with appropriate credentials
- Access to the relevant AWS account and permissions to create the necessary resources
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.54.0 |


## Resources

| Name | Type |
|------|------|
| [aws_elasticache_cluster.memcached](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |
| [aws_elasticache_replication_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Specifies whether a read replica is automatically promoted to read/write primary if the existing primary fails (only for redis) | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Elasticache cluster | `string` | n/a | yes |
| <a name="input_engine"></a> [engine](#input\_engine) | The Elasticache engine to use, either redis or memcached | `string` | `"memcached"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version of the Elasticache engine | `string` | `"1.5.16"` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Specifies the weekly time range for maintenance | `string` | `"sun:05:00-sun:09:00"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The instance class for the Elasticache nodes | `string` | `"cache.t3.micro"` | no |
| <a name="input_num_cache_nodes"></a> [num\_cache\_nodes](#input\_num\_cache\_nodes) | The number of cache nodes (for memcached) or number of replicas (for redis) | `number` | `1` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | The name of the parameter group to associate with the cache cluster | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy the resources in | `string` | `"us-east-1"` | no |
| <a name="input_replication_group_id"></a> [replication\_group\_id](#input\_replication\_group\_id) | The replication group identifier (only for redis) | `string` | `""` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs to associate with the Elasticache cluster | `list(string)` | <pre>[<br>  "sg-067a85f23eb1ac35e",<br>  "sg-0de63c3aff5174878"<br>]</pre> | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | The number of days to retain snapshots | `number` | `0` | no |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | The daily time range (in UTC) during which snapshots are taken | `string` | `"05:00-09:00"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the cache subnet group | `list(string)` | <pre>[<br>  "subnet-0b61aa1ee29dc88bb",<br>  "subnet-06a00fc1e8301379d"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticache_cluster_address"></a> [elasticache\_cluster\_address](#output\_elasticache\_cluster\_address) | The address of the memcached cluster |
| <a name="output_elasticache_cluster_id"></a> [elasticache\_cluster\_id](#output\_elasticache\_cluster\_id) | The ID of the memcached cluster |
