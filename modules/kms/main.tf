
data "aws_iam_policy_document" "kms_policy" {
  statement {
    sid = "Enable IAM User Permissions"
    
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:root"]
    }
    actions = [
      "kms:*"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    sid = "Allow usage for specific services"
    
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = var.service_principle
    }
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = [
      "*"
    ]
    condition {
      test     = "StringEquals"
      variable = "kms:CallerAccount"
      values = [
        var.account_id
      ]
    }
  }
}

resource "aws_kms_key" "kms" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  policy = data.aws_iam_policy_document.kms_policy.json
}
