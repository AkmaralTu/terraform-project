output "buckets_ids_outbound" {
  value = [for key, bucket in aws_s3_bucket.s3_outbound : bucket.id]
}

output "buckets_outbound" {
  value = [ for key, bucket in aws_s3_bucket.s3_outbound : bucket]
}
