# Use the default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Fetch subnets in the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [aws_default_vpc.default.id]
  }
}


module "alb" {
  source = "../../modules/alb"

  name                     = "ahmeds-alb"
  vpc_id                   = aws_default_vpc.default.id
  subnet_ids               = data.aws_subnets.default.ids
  create_security_group    = true
  existing_security_group_ids = [] # Only used if create_security_group is false
  ingress_rules            = [
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]

  # access_logs_enabled      = true
  # access_logs_bucket       = "ahmeds-alb-logs-bucket"
  # access_logs_prefix       = "alb-logs"

  access_logs_enabled      = false
  access_logs_bucket       = null
  access_logs_prefix       = null
  enable_deletion_protection = false

  target_groups = [
    {
      name     = "ahmeds-target-group"
      port     = 80
      protocol = "HTTP"
      target_type = "ip"
      health_check = {
        path                = "/health"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 5
        interval            = 30
        matcher             = "200-299"
      }
    }
  ]

  listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Example"
    Project     = "ALB-Demo"
  }
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "target_group_arns" {
  description = "ARNs of the target groups"
  value       = module.alb.target_group_arns
}

# examples/alb/main.tf

resource "aws_wafv2_ip_set" "blocked_ips" {
  name               = "blocked-ips"
  description        = "Blocked IP addresses"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = ["192.0.2.0/24", "198.51.100.0/24"]
}

module "waf" {
  source = "../../modules/waf"

  name        = "ahmeds-waf"
  description = "WAF for my ALB"
  scope       = "REGIONAL"

  rules = [
    {
      name     = "BlockIpSet"
      priority = 1
      action   = "block"
      type     = "ip_set"
      ip_set_arn = aws_wafv2_ip_set.blocked_ips.arn
    }
  ]

  associate_alb = true
  alb_arn       = module.alb.alb_arn

  tags = {
    Environment = "Example"
    Project     = "WAF-Demo"
  }
  
  depends_on = [aws_wafv2_ip_set.blocked_ips]
}

output "waf_web_acl_id" {
  description = "ID of the WAF Web ACL"
  value       = module.waf.web_acl_id
}

output "waf_web_acl_arn" {
  description = "ARN of the WAF Web ACL"
  value       = module.waf.web_acl_arn
}

output "blocked_ips_arn" {
  value = aws_wafv2_ip_set.blocked_ips.arn
}
