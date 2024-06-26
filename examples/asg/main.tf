module "traveloka_asg" {
  source                    = "../../modules/asg"
  name                      = "traveloka-asg"
  min_size                  = 0
  max_size                  = 0
  desired_capacity          = 0
  vpc_zone_identifier       = ["subnet-0b61aa1ee29dc88bb", "subnet-06a00fc1e8301379d"]
  
  launch_template_name_prefix = "traveloka"
  image_id                  = "ami-08a0d1e16fc3f61ea"
  instance_type             = "t2.micro"
  security_group_ids        = ["sg-0df29c8e5b8ffb7ea"]
  tags = {
    Name                 = "traveloka"
    Environment          = "traveloka"
  }
}
