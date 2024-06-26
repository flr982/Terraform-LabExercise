resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = merge(
    var.common_tags,
    {
      Name = "MyS3Bucket"
    }
  )
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = var.block_public_access["block_public_acls"]
  block_public_policy     = var.block_public_access["block_public_policy"]
  ignore_public_acls      = var.block_public_access["ignore_public_acls"]
  restrict_public_buckets = var.block_public_access["restrict_public_buckets"]
}

