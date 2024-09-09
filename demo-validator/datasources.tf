

# # Data source block for accessing data
# data "aws_ami" "infra_code_ami" {
#   # Query constraint: Most recent AMI
#   most_recent = true

#   # Query constraint: AMI owned by the "infra-code" team
#   owners = ["infra-code"]

#   # Query constraint: Filter by name
#   filter {
#     name   = "name"
#     values = ["app_server_*"]
#   }
# }

# # Resource: AWS instance using AMI ID from data source
# resource "aws_instance" "infra_code_server" {
#   # Use data from data source
#   ami = data.aws_ami.infra_code_ami.id
#   instance_type = "t2.micro"
# }



# data "aws_ami" "infra_demo" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*"]
#   }
# }

# data "aws_vpc" "infra_demo" {
#   id = "vpc-abc1234d"
# }

# data "aws_vpc" "infra_demo_vpc" {
#   default = true
# }
# data "aws_subnet" "infra_demo_subnets" {
#   vpc_id = data.aws_vpc.infra_demo_vpc.id
# }

# data "aws_ec2_instance_type_offerings" "infra_demo_instance_type" {
#   filter {
#     name   = "instance-type"
#     values = ["t2.micro"]
#   }

#   location_type = "region"
# }

# # This resource will only be created if the data source returns at least one result.
# # The in
# resource "aws_instance" "example" {
#   count         = length(data.aws_ec2_instance_type_offerings.infra_demo_instance_type.instance_types) > 0 ? 1 : 0
#   ami           = "ami-0abcdef1234567890"
#   instance_type = "t2.micro"
#   key_name      = "MyKeyPair"
#   vpc_security_group_ids = ["my-sg"]
# }

# data "aws_iam_policy_document" "infra_demo" {
#   statement {
#     actions   = ["s3:ListBucket"]
#     resources = ["arn:aws:s3:::bucket"]
#   }
# }