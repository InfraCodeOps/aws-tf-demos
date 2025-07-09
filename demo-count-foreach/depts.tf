resource "aws_subnet" "dept_subnets" {
  for_each = local.depts
  vpc_id = aws_vpc.first.id
  cidr_block = "10.0.${each.value.code+10}.0/24"
  tags = {
    Name = "Subnet-${each.value.name}"
    Manager = each.value.manager
    Location = each.value.location
    Code = each.key
  }
}

resource "aws_instance" "dept_vms" {
  for_each = local.depts
  ami = "ami-08bfb3ff75119bd97"
  instance_type = "t2.nano"
  subnet_id = aws_subnet.dept_subnets[each.key].id
  tags = {
    Name = "VM-${each.value.name}"
    Manager = each.value.manager
    Location = each.value.location
    Code = each.key
  }
}

locals {
  depts = {for x in csvdecode(file("depts.csv")) : x.code => x}
}