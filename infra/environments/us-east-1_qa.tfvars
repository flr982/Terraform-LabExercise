env     = "qa"
project = "lab"
region  = "us-east-1"

# Network
vpc_cidr     = "10.1.0.0/16"
subnet_cidrs = ["10.1.1.0/24", "10.1.2.0/24"]
security_groups = {
  "lab-qa" = {
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
ami_id        = "ami-00beae93a2d981137"
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
