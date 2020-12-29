terraform {
  backend "s3" {
    bucket = "pact-terraform-test"
    key    = "${var.bucket_name}.tfstate"
    region = var.aws_region
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
