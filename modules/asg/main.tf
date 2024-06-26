resource "aws_launch_template" "autoscaling_launch_template" {
  name_prefix    = var.launch_template_name_prefix
  image_id       = var.image_id
  instance_type  = var.instance_type
  key_name       = var.key_name
  user_data      = var.user_data

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }
}

resource "aws_autoscaling_group" "autoscaling_group" {
  name                      = var.name
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  vpc_zone_identifier       = var.vpc_zone_identifier
  launch_template {
    id                      = aws_launch_template.autoscaling_launch_template.id
    version                 = aws_launch_template.autoscaling_launch_template.latest_version
  }

  // Conditional optional arguments
  dynamic "tag" {
    for_each = var.tags != null ? tomap(var.tags) : {}
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
