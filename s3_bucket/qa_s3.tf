module "s3_bucket_qa" {
    source                   = "git::https://github.com/AkmaralTu/modules.git?ref=v0.0.1"  #../s3_bucket_module
    bucket_name              = "team-qa-bucket"
    bucket_versioning_status = "Enabled"
    bucket_tags = {
        owner = "maral"
  }
}