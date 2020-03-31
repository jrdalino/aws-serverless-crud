terraform {
  backend "s3" {
    region         = "ap-southeast-2"
    bucket         = "222337787619-ap-southeast-2-terraform-state"
    key            = "aws-serverless-crud.tfstate"
    encrypt        = "true"
    dynamodb_table = "terraform-state-lock"
  }
}