provider "aws" {
  region = "us-east-1"
}

# Create the S3 bucket (no ACL used, follows AWS best practices)
resource "aws_s3_bucket" "private-s3-bucket" {
  bucket = "google-banking-s3bucket-version-5-0-1"

  tags = {
    Name        = "Private S3 Bucket"
    Environment = "Dev"
    Owner       = "Rahul"
  }
}

# Block all forms of public access to the bucket
resource "aws_s3_bucket_public_access_block" "block_access" {
  bucket = aws_s3_bucket.private-s3-bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
