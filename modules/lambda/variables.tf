variable "aws_region" {
  description = "AWS region to launch the EC2 instance"
  type        = string
  default     = "us-east-1"
}

variable "env" {
  description = "Name of the environment"
  type        = string
}

variable "project" {
  description = "Name of the project"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket that the Lambda function will access"
  type        = string
}

variable "lambda_handler" {
  description = "The function entrypoint in your code"
  type        = string
}

variable "runtime" {
  description = "The identifier of the function's runtime"
  type        = string
  default     = "python3.0"
}

variable "common_tags" {
  description = "Map of common tags"
  type        = map(any)
}
