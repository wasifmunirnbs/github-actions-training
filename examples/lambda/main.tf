module "lambda-s3" {
  source = "../../modules/lambda"

////////////////////////////////////////////////////////////////////  
#   create_package = false
#   s3_existing_package = {
#     bucket  = "ahmeds-lambda-booket"
#     key     = "lambda_function.zip"
#     # version = "1"  # Optional. Remove if not using versioning.
#   }
////////////////////////////////////////////////////////////////////
  create_package = true
  source_path    = "lambda_function.py"
  s3_bucket      = "ahmeds-lambda-booket"

  function_name = "my-local-lambda-function"
  handler       = "index.handler"
  runtime       = "python3.8"
  memory_size   = 256
  timeout       = 10

  environment_variables = {
    ENV_VAR_1 = "value1"
    ENV_VAR_2 = "value2"
  }

  tags = {
    Environment = "Development"
    Project     = "MyLocalProject"
  }

  log_retention_in_days = 1
}