variable "aws_region" {
  description = "AWS region for the S3 bucket"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "State of versioning for the S3 bucket"
  type        = string
  default     = "Enabled"
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm"
  default     = "AES256"
}

variable "block_public_access" {
  description = "Block public access settings for the S3 bucket"
  type        = map(bool)
  default = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
}

variable "common_tags" {
  description = "Map of common tags"
  type        = map(any)
}
