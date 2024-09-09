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

# Create two items in an AWS DynamoDB table
resource "aws_dynamodb_table_item" "course1" {
    table_name = aws_dynamodb_table.infra-code-ddb.name
    hash_key   = aws_dynamodb_table.infra-code-ddb.hash_key
    item       = <<ITEM
{
    "CourseID": {"S": "CSCI101"},
    "CourseName": {"S": "Intro to Computer Science"},
    "CourseCredit": {"N": "3"},
    "Instructor": {"S": "Dr. Smith"},
    "Semester": {"S": "Fall 2022"}
} 
ITEM
}

resource "aws_dynamodb_table_item" "course2" {
    table_name = aws_dynamodb_table.infra-code-ddb.name
    hash_key   = aws_dynamodb_table.infra-code-ddb.hash_key
    item       = <<ITEM
{
    "CourseID": {"S": "PHY101"},
    "CourseName": {"S": "Intro to Physics"},
    "CourseCredit": {"N": "3"},
    "Instructor": {"S": "Dr. Johnson"},
    "Semester": {"S": "Fall 2022"}
} 
ITEM
}

# Creates an AWS DynamoDB table with the name "infra-code-ddb",
# read and write capacities of 10, and a hash key of "CourseID".

resource "aws_dynamodb_table" "infra-code-ddb" {
    name           = "infra-code-ddb"
    read_capacity  = 10
    write_capacity = 10
    hash_key       = "CourseID"
    attribute {
        name = "CourseID"
        type = "S"
    }
}



# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }
# provider "aws" {
#   profile = "default"
#   region  = "us-west-2"
# }
# resource "aws_dynamodb_table_item" "mytfdb-name" {
#   table_name = aws_dynamodb_table.mytfdb-name.name
#   hash_key   = aws_dynamodb_table.mytfdb-name.hash_key
#   item       = <<ITEM
# {
#   "mytfdbHashKey": {"S": "apple"},
#   "one": {"N": "111"},
#   "two": {"N": "222"},
#   "three": {"N": "333"},
#   "four": {"N": "444"}
# } 
# ITEM
# }

# resource "aws_dynamodb_table" "mytfdb-name" {
#   name           = "mytfdb-name"
#   read_capacity  = 10
#   write_capacity = 10
#   hash_key       = "mytfdbHashKey"
#   attribute {
#     name = "mytfdbHashKey"
#     type = "S"
#   }
# }