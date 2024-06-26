output "custom_db_parameter_group_name" {
  value = aws_db_parameter_group.custom.name
}

output "custom_db_subnet_group_name" {
  value = aws_db_subnet_group.custom.name
}

output "custom_security_group_id" {
  value = aws_security_group.custom.id
}