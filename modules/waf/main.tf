# modules/waf/main.tf

resource "aws_wafv2_web_acl" "this" {
  name        = var.name
  description = var.description
  scope       = var.scope

  default_action {
    allow {}
  }

  dynamic "rule" {
    for_each = var.rules
    content {
      name     = rule.value.name
      priority = rule.value.priority

      action {
        dynamic "allow" {
          for_each = rule.value.action == "allow" ? [1] : []
          content {}
        }
        dynamic "block" {
          for_each = rule.value.action == "block" ? [1] : []
          content {}
        }
        dynamic "count" {
          for_each = rule.value.action == "count" ? [1] : []
          content {}
        }
      }

      statement {
        dynamic "ip_set_reference_statement" {
          for_each = rule.value.type == "ip_set" ? [rule.value.ip_set_arn] : []
          content {
            arn = ip_set_reference_statement.value
          }
        }
        dynamic "managed_rule_group_statement" {
          for_each = rule.value.type == "managed_rule_group" ? [rule.value.managed_rule_group_name] : []
          content {
            name        = managed_rule_group_statement.value
            vendor_name = "AWS"
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.name
        sampled_requests_enabled   = true
      }
    }
  }

  tags = var.tags

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = var.name
    sampled_requests_enabled   = true
  }
}

resource "aws_wafv2_web_acl_association" "this" {
  count        = var.associate_alb ? 1 : 0
  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.this.arn
}
