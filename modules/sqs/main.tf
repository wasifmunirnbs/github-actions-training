resource "aws_sqs_queue" "sqs" {
  name                       = var.queue_name
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  fifo_queue                 = var.fifo_queue

  redrive_policy = var.enable_redrive_policy ? jsonencode({
    deadLetterTargetArn = var.dead_letter_target_arn
    maxReceiveCount     = var.max_receive_count
  }) : null

  kms_master_key_id = var.enable_sse_kms ? var.kms_master_key_id : null

  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds

  sqs_managed_sse_enabled = var.enable_sse_sqs ? true : null

  tags = var.tags
}

data "aws_iam_policy_document" "sqs_policy" {
  statement {
    sid = "AllowSQSSendMessage"

    effect = "Allow"
    actions = [
      "sqs:SendMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl"
    ]
    resources = [
      aws_sqs_queue.sqs.arn
    ]

    condition {
      test     = "ArnEquals"
      variable = "aws:PrincipalArn"
      values = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }
  }

  statement {
    sid = "AllowSQSReceiveMessage"

    effect = "Allow"
    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes"
    ]
    resources = [
      aws_sqs_queue.sqs.arn
    ]

    condition {
      test     = "ArnEquals"
      variable = "aws:PrincipalArn"
      values = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }
  }
}

resource "aws_iam_policy" "sqs_policy" {
  name   = "${var.queue_name}_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.sqs_policy.json
}

data "aws_caller_identity" "current" {}
