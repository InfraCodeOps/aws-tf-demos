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

resource "aws_ebs_volume" "demo-volume" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = {
    Name = "Hello Infra"
  }
}