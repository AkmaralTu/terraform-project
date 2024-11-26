resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  tags = var.bucket_tags
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
    bucket = aws_s3_bucket.s3_bucket.id
    versioning_configuration {
    status = var.bucket_versioning_status
  }
}
resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    status = "Enabled"
    id = "delete-temp-files"
    expiration {  # для удаления уйдет temp временные файлы через 30 дней
      days = 30
    }
  }
   rule {
    status = "Enabled"
    id = "archive-log-files"
    transition {  # для архивизация уйдет лог файлы через 30 дней
      days = 30
      storage_class = "GLACIER"
    }
  }
}

