output "autoscaling_group_name" {
  description = "Name of the autoscaling group"
  value       = aws_autoscaling_group.autoscaling_group.name
}

output "autoscaling_group_id" {
  description = "ID of the autoscaling group"
  value       = aws_autoscaling_group.autoscaling_group.id
}

output "autoscaling_group_arn" {
  description = "ARN of the autoscaling group"
  value       = aws_autoscaling_group.autoscaling_group.arn
}
