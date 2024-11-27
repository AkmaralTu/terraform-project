module "aws_s3_bucket" {
  source                   = "../s3_bucket_module"
  bucket_name              = "my-bucket9911"
  bucket_versioning_status = "Enabled"
  bucket_tags = {
    owner = "maral"
  }
}