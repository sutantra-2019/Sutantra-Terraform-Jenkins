terraform {
  backend "s3" {
    bucket = "pact-terraform"
    key    = "pact-s3-buckets.tfstate"
    region = "us-west-2"
  }
}

# ----------------------------------------------------------------------------------------
# S3 Bucket To Store The Terraform State Files
# ----------------------------------------------------------------------------------------

resource "aws_s3_bucket" "Terraform-Bucket" {
  bucket = var.bucket_name
  acl    = "private"
  tags   = var.tags

  versioning {
    enabled = var.s3_object_versioning
  }
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_public_access_block" "s3_public_access" {
  bucket                  = var.bucket_name
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  depends_on = [aws_s3_bucket.Terraform-Bucket]
}
