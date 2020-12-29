terraform {
  backend "s3" {
    bucket = "pact-terraform-test"
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
