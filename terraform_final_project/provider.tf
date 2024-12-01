provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "europe"
  region = "eu-west-1"
}

provider "aws" {
  alias  = "asia"
  region = "ap-southeast-1"
}