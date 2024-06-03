terraform {
  backend "s3" {
    key            = "us-east-1/staging/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "my-lock-table"
    encrypt        = true
  }
}
