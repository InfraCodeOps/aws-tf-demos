terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

locals {
  app_name = "infra-code-ops"
}

resource "aws_s3_bucket" "infra-storage" {
  bucket = "${local.app_name}-assets"

  tags = {
    Name        = "Demo bucket"
    Environment = "Dev"
  }
}

# resource "aws_s3_bucket" "app_assets" {
#   bucket = "${local.app_name}-assets"
#   tags = {
#     Name = "${local.app_name}-assets"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "app_assets" {
#   bucket = aws_s3_bucket.app_assets.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# resource "aws_s3_bucket_ownership_controls" "app_assets" {
#   bucket = aws_s3_bucket.app_assets.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_acl" "app_assets" {
#   depends_on = [
#     aws_s3_bucket_public_access_block.app_assets,
#     aws_s3_bucket_ownership_controls.app_assets,
#   ]

#   bucket = aws_s3_bucket.app_assets.id
#   acl    = "public-read"
# }


# output "s3bucketaddy" {
#   value = aws_s3_bucket.app_assets.id
# }