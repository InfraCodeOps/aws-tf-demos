terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_vpc" "infra_ops_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "infra-ops-demo-vpc"
  }
}

resource "aws_subnet" "infra_ops_subnet_1" {
  vpc_id     = aws_vpc.infra_ops_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "infra-ops-demo-subnet-1"
  }
}

resource "aws_subnet" "infra_ops_subnet_2" {
  vpc_id     = aws_vpc.infra_ops_vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "infra-ops-demo-subnet-2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.infra_ops_vpc.id

  tags = {
    Name = "infra-ops-demo-gw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.infra_ops_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "infra-ops-demo-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.infra_ops_subnet_1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.infra_ops_subnet_2.id
  route_table_id = aws_route_table.rt.id
}