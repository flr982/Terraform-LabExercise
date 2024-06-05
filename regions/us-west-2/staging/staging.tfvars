env     = "staging"
project = "lab"
region  = "us-west-2"

# Network
vpc_cidr     = "10.5.0.0/16"
subnet_cidrs = ["10.5.1.0/24", "10.5.2.0/24"]
security_groups = {
  "lab-staging" = {
    ingress = [
      {
        description = "SSH"
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks = "0.0.0.0/0"
      }
    ]
    egress = [
      {
        from_port   = "0"
        to_port     = "0"
        protocol    = "-1"
        cidr_blocks = "0.0.0.0/0"
      }
    ]
  }
}


#EC2
ami_id        = "ami-0a2781a262879e465"
instance_type = "t2.micro"

#S3
versioning = "Enabled"
block_public_access = {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Lambda
lambda_handler = "rolecall.lambda_handler"
runtime        = "python3.8"
