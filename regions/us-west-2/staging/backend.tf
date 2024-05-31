terraform {
  backend "s3" {
    bucket         = "homelab-tfstates"
    key            = "us-west-1/staging/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "my-lock-table"
    encrypt        = true
  }
}
