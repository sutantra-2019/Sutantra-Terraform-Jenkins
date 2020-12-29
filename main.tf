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
  /*
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.Key-Terraform-S3Bucket.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
  */
}
