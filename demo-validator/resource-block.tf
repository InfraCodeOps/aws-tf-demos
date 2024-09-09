terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

# # Defines an AWS instance with a specific AMI and instance type
# resource "aws_instance" "infra-demo-web" {
#   ami           = "ami-a1b2c3d4"
#   instance_type = "t2.micro"
# }

# # Creates a unique AWS VPC with a specified CIDR block
# resource "aws_vpc" "infra-demo-network" {
#   cidr_block = "10.0.0.0/16"
# }

# # Sets AWS as the provider and creates a private s3 bucket

# resource "aws_s3_bucket" "infra-demo-bucket" {
#   bucket = "infra-demo-bucket"
#   acl    = "private" # this is deprecated
# }

# # Creates a security group with specific 
# # ingress rules in a particular VPC
# resource "aws_security_group" "infra-demo-sg" {
#   name        = "infra-demo-sg"
#   description = "Security Group for infra-demo"
#   vpc_id      = "vpc-a1b2c3d4"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }



# // Retrieve the most recent Amazon Linux AMI 
# data "aws_ami" "infra-demo-webb" {
#   most_recent = true
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
#   owners = ["137112412989"] // Amazon
# }
# # Creates an instance with a precondition
# # to verify the AMI architecture
# resource "aws_instance" "infra-demo-webb" {
#   ami           = "ami-a1b2c3d4"
#   instance_type = "t2.micro"

#   lifecycle {
#     precondition {
#       condition     = data.aws_ami.infra-demo-webb.architecture == "x86_64"
#       error_message = "The selected AMI must be for the x86_64 architecture."
#     }
#   }
# }

# # Establishes a DB instance with
# # customized creation and deletion timeouts
# resource "aws_db_instance" "infra-demo-db" {
#   allocated_storage = 20
#   engine            = "mysql"
#   engine_version    = "5.7"
#   instance_class    = "db.t2.micro"
#   username          = "admin"
#   password          = "password"
#   parameter_group_name = "default.mysql5.7"

#   timeouts {
#     create = "60m"
#     delete = "2h"
#   }
# }