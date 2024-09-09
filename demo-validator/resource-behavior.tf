# # Creating a AWS instance using Terraform
# resource "aws_instance" "infra-demo-web" {
#   ami           = "ami-a1b2c3d4"
#   instance_type = "t2.micro"
# }

# # Updating an AWS instance type
# resource "aws_instance" "infra-demo-web2" {
#   ami           = "ami-a1b2c3d4"
#   instance_type = "t2.medium"  # Changed from t2.micro
# }

# # Accessing the public IP of an AWS instance
# output "ip" {
#   value = aws_instance.infra-demo-web.public_ip
# }

# # AWS instance implicitly depends on the security group
# resource "aws_security_group" "infra-demo-sg" {
#   name = "example"
# }

# resource "aws_instance" "infra-demo-server" {
#   ami           = "ami-a1b2c3d4"
#   instance_type = "t2.micro"
  
#   vpc_security_group_ids = [aws_security_group.infra-demo-sg.id]
# }

# # AWS instance explicitly depends on the security group
# resource "aws_security_group" "infra-demo-sg2" {
#   name = "example"
# }

# resource "aws_instance" "infra-demo-vm" {
#   ami           = "ami-a1b2c3d4"
#   instance_type = "t2.micro"
  
#   depends_on = [aws_security_group.infra-demo-sg2]
# }

# # Creating a random pet name
# resource "random_pet" "example" {
#   length = 3
# }