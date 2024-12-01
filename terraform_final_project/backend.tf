terraform {
  backend "s3" {
    bucket = "statefiles-tf1105"
    key = "state-file-for0-0112"
    region = "us-east-1"
    dynamodb_table = "for_lock_tokeeptrack"
    encrypt = true
  }
}