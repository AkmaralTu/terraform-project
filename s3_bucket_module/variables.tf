variable "bucket_name" {
  description = "Name of your bucket"
  type = string
}

variable "bucket_tags" {
  description = "Comment(tags) for your bucket"
}
variable "bucket_versioning_status" {
  description = "enabled=archive"
}
