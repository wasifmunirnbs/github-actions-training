module "basic_dynamodb_table" {
  source                = "../../modules/dynamodb"
  name                  = "Traveloka"
  hash_key              = "Traveloka"
  range_key             = "Traveloka"
  
  // Optional: Billing Mode, Read and Write Capacity, TTL settings, etc.
  // billing_mode       = "PROVISIONED"
  // read_capacity      = 1
  // write_capacity     = 1
  // ttl_enabled        = false
  // ttl_attribute_name = ""

  // Optional: Global Secondary Index
  // global_secondary_indexes = [{
  //   name               = "Traveloka"
  //   hash_key           = "Traveloka"
  //   range_key          = "Traveloka"
  //   write_capacity     = 1
  //   read_capacity      = 1
  //   projection_type    = "INCLUDE"
  //   non_key_attributes = ["UserId"]
  // }]
  
  // Optional: Tags
  tags = {
    Name        = "traveloka"
    Environment = "training"
  }
}
