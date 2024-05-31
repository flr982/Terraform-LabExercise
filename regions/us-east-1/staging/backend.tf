terraform {
  backend "s3" {
    bucket         = "homelab-tfstates"
    key            = "us-east-1/staging/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "my-lock-table"
    encrypt        = true
  }
}
