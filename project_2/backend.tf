terraform {
  backend "s3" {
    bucket = "statefile12"  #name created in aws by youself bucket
    key = "state_file_from_terraform" #file or folder name in aws s3 after installing
    region = "us-east-1"
    dynamodb_table = "for_lock_tokeeptrack" #name created in aws DynomoDB 
    encrypt = true
 
  }
}