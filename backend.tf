terraform {
  backend "s3" {
    bucket = "bucketforterraformstate"
    key = "bucket"
    region = "us-east-1"
    dynamodb_table = "terraform_state"
    encrypt = true
  }
}