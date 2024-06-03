terraform {
  backend "s3" {
    key            = "us-west-1/prod/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "my-lock-table"
    encrypt        = true
  }
}
