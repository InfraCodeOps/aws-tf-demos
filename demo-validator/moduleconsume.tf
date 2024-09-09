module "server" {  # Declare the module
  source  = "terraform-aws-modules/ec2-instance/aws"  # Source of the module
  version = "2.12.0"  # Version of the module

  name = "my-server"  # Input variable: name of the server
  instance_count = 5  # Input variable: number of instances

  ami = "ami-0c94855ba95c574c8"  # Input variable: Amazon Machine Image ID
  instance_type = "t2.micro"  # Input variable: type of instance
  key_name = "user"  # Input variable: SSH key name
  vpc_security_group_ids = ["sg-0a9d45abc6f66b6f2"]  # Input variable: security group IDs

  tags = {  # Input variable: tags for the instances
    Terraform = "true"
    Environment = "dev"
  }
}

import {
  to = aws_instance.example
  id = "i-abcd1234"
}

resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami = "abc"
  tags = {
    Name = "InfraCodeDemo"
  }
}
