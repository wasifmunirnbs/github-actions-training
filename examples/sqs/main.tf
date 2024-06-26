module "sqs" {
  source = "../../modules/sqs"

  queue_name                        = "sqs-queue"
  delay_seconds                     = 0
  max_message_size                  = 262144
  message_retention_seconds         = 345600
  receive_wait_time_seconds         = 0
  visibility_timeout_seconds        = 30
  fifo_queue                        = false
  enable_redrive_policy             = false
  dead_letter_target_arn            = "Specify arn in case of dead letter queue in case of redrive policy"
  max_receive_count                 = 5
  enable_sse_sqs                    = true
  enable_sse_kms                    = false
  kms_master_key_id                 = "Specify kms key in case off sse-kms encryption"
  kms_data_key_reuse_period_seconds = 300
  tags = {
    Environment = "dev"
    Project     = "sqs-project"
  }
}
