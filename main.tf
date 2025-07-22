provider "aws" {
  region = "us-east-1"
}

# Step 1: Create the S3 bucket without ACL
resource "aws_s3_bucket" "private-s3-bucket" {
  bucket = "google-banking-s3bucket-version-5-0-1"
}

# Step 2: Apply the private ACL using new resource type
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.private-s3-bucket.id
  acl    = "private"
}

# Step 3: Block all public access (security best practice)
resource "aws_s3_bucket_public_access_block" "block_access" {
  bucket = aws_s3_bucket.private-s3-bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
