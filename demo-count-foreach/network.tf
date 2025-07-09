resource "aws_vpc" "first" {
    tags = {
        Name = "Tuesday VPC"
        Dept = "Engineering"
        Org = "Coffee Org"
    }
    cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "first_subnet" {
  vpc_id = aws_vpc.first.id # implicit dependency
  # cidr_block = "10.0.0.0/24"
  cidr_block = cidrsubnet(aws_vpc.first.cidr_block,8,0)
  tags = {
    Name = "First Subnet"
  }

   # depends_on = [ aws_vpc.first ]
}

resource "aws_subnet" "more_subnets" {
  vpc_id = aws_vpc.first.id # implicit dependency
  # cidr_block = "10.0.${count.index+1}.0/24"
  cidr_block = cidrsubnet(aws_vpc.first.cidr_block,8,count.index+1)
  count = 3
  tags = {
    Name = "subnet-${count.index+1}"
  }
}
