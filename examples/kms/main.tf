module "kms" {
  source                  = "../../modules/kms"
  region                  = "us-east-1"
  description             = "KMS key with conditional policies per service"
  deletion_window_in_days = 10
  account_id              = "339712743018"
  service_principle                = ["lambda.amazonaws.com", "cloudtrail.amazonaws.com"]
}

output "kms_key_id" {
  value = module.kms.kms_key_id
}
