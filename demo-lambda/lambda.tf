
// Specifies the required providers and their versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" // Specifies the source of the provider
      version = "~> 5.0"        // Specifies the version of the provider
    }
  }
}

// Configures the AWS provider with the specified region
provider "aws" {
  region = "us-west-2" // Specifies the AWS region
}

// Creates an IAM role with the specified name and policy
resource "aws_iam_role" "lambda_role" {
  name = "InfraCodeDemo_lambda_role" // Specifies the name of the IAM role

  // Specifies the policy that grants AWS Lambda permission to assume the role
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

// Creates an AWS Lambda function with the specified properties
resource "aws_lambda_function" "InfraCodeDemo" {
  function_name = "icd-function"                // Specifies the name of the Lambda function
  handler       = "icd-function.lambda_handler" // Specifies the handler of the Lambda function
  runtime       = "python3.8"                   // Specifies the runtime of the Lambda function
  role          = aws_iam_role.lambda_role.arn  // Specifies the IAM role that the Lambda function assumes

  // Specifies the ZIP file that contains the code of the Lambda function
  filename = data.archive_file.lambda_zip.output_path

  // If you want to detect code changes and zip file changes:
  // source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)

  // Specifies the tags of the Lambda function
  tags = {
    Name = "InfraCodeDemo-lambda"
  }
}

// Creates a ZIP file that contains the specified file
data "archive_file" "lambda_zip" {
  type        = "zip"              // Specifies the type of the archive file
  source_file = "icd-function.py"  // Specifies the source file to be included in the archive file
  output_path = "icd-function.zip" // Specifies the output path of the archive file
}
