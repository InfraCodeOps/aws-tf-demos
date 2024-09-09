# resource "aws_instance" "infra-vm" {  # Define AWS instance resource
#   for_each      = {                   # Iterate over servers
#     server1     = "ami-abc12345"      # Server 1 AMI ID
#     server2     = "ami-xyz67890"      # Server 2 AMI ID
#   }
#   ami           = each.value          # Use corresponding AMI ID
#   instance_type = "t2.micro"          # Set instance type

#   tags = {
#     Name = each.key                   # Tag instance with server name
#   }
# }


# # provider "aws" {
# #   region = "us-west-2"
# # }
# provider "aws" {
#   alias = "eastern"
#   region = "us-east-2"
# }

# resource "aws_instance" "infra-demo-vm" {
#   provider = aws.eastern # Uses alternate AWS provider
#   ami = "ami-0aeeeb1ebd1f5f54e"
#   instance_type = "t2.micro"
# }

# resource "aws_instance" "example" {
#   ami = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"

#   lifecycle {
#     create_before_destroy = true # New instance created before old is destroyed
#     ignore_changes = [ami, instance_type] # Ignores changes to AMI and instance type
#   }
# }