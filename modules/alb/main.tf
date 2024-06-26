resource "aws_lb" "this" {
  name               = var.name
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = var.create_security_group ? [aws_security_group.this[0].id] : var.existing_security_group_ids

  dynamic "access_logs" {
    for_each = var.access_logs_enabled ? [1] : []
    content {
      bucket  = var.access_logs_bucket
      prefix  = var.access_logs_prefix
      enabled = true
    }
  }

  enable_deletion_protection = var.enable_deletion_protection

  tags = var.tags
}


resource "aws_security_group" "this" {
  count       = var.create_security_group ? 1 : 0
  name        = "${var.name}-alb-sg"
  vpc_id      = var.vpc_id
  description = "Security group for the Application Load Balancer"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = ingress.value.cidr_blocks
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_lb_target_group" "this" {
  count       = length(var.target_groups)
  name        = var.target_groups[count.index].name
  port        = var.target_groups[count.index].port
  protocol    = var.target_groups[count.index].protocol
  vpc_id      = var.vpc_id
  target_type = var.target_groups[count.index].target_type

  health_check {
    path                = var.target_groups[count.index].health_check.path
    healthy_threshold   = var.target_groups[count.index].health_check.healthy_threshold
    unhealthy_threshold = var.target_groups[count.index].health_check.unhealthy_threshold
    timeout             = var.target_groups[count.index].health_check.timeout
    interval            = var.target_groups[count.index].health_check.interval
    matcher             = var.target_groups[count.index].health_check.matcher
  }

  tags = var.tags
}

resource "aws_lb_listener" "this" {
  count             = length(var.listeners)
  load_balancer_arn = aws_lb.this.arn
  port              = var.listeners[count.index].port
  protocol          = var.listeners[count.index].protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this[var.listeners[count.index].target_group_index].arn
  }
}