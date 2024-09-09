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


data "archive_file" "app_zip" {
  type        = "zip"
  source_file = "application.py"
  output_path = "app.zip"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-app-bucket"
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.bucket.id
  key    = "app.zip"
  source = data.archive_file.app_zip.output_path
}

resource "aws_elastic_beanstalk_application" "app" {
  name        = "my-app"
  description = "a description"
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = "my-env"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.9.0 running Python 3.4"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
}
