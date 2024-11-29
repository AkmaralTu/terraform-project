module "dev_bucket" {
  source                   = "git::https://github.com/AkmaralTu/modules.git?ref=v0.0.1"  #../s3_bucket_module
  bucket_name              = "dev-s3-bucket456"
  bucket_versioning_status = "Enabled"
  bucket_tags = {
    owner = "maral"
  }
}
