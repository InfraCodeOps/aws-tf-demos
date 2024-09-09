# Define the required AWS provider and version
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

# Configure the AWS provider with a profile and region
provider "aws" {
    profile = "default"
    region  = "us-west-2"
}

# Create an IAM user with the name "infra-demo-test-user"
resource "aws_iam_user" "user" {
    name = "infra-demo-test-user"
}

# Create an IAM role with the name "infra-demo-test-role"
# The role includes an assume role policy that allows EC2 instances to assume the role
resource "aws_iam_role" "infra-demo-test-role" {
    name = "infra-demo-test-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action = "sts:AssumeRole",
                Principal = {
                    Service = "ec2.amazonaws.com"
                },
                Effect = "Allow",
            },
        ]
    })
}

# Create an IAM policy with the name "infra-demo-test-policy"
# The policy allows the "s3:ListBucket" action on the "example_bucket" S3 bucket
resource "aws_iam_policy" "list-bucket-policy" {
    name = "infra-demo-test-policy"
    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action   = ["s3:ListBucket"],
                Effect   = "Allow",
                Resource = ["arn:aws:s3:::example_bucket"]
            }
        ]
    })
}

# Attach the "AmazonS3FullAccess" policy to the IAM user created by the "aws_iam_user" resource
# This policy grants full access to all S3 resources
resource "aws_iam_policy_attachment" "attach-full-access" {
    name       = "infra-demo-test-attachment"
    users      = [aws_iam_user.user.name]
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Attach the IAM policy created by the "aws_iam_policy" resource to the IAM user created by the "aws_iam_user" resource
# This policy allows the "s3:ListBucket" action on the "example_bucket" S3 bucket
resource "aws_iam_policy_attachment" "attach-list-bucket-policy" {
    name       = "infra-demo-test-attachment"
    users      = [aws_iam_user.user.name]
    policy_arn = aws_iam_policy.list-bucket-policy.arn
}