output "bucket_name" {
  value = data.aws_s3_bucket.static_site.bucket
}

output "bucket_id" {
  value = data.aws_s3_bucket.static_site.id
}

output "bucket_domain_name" {
  value = data.aws_s3_bucket.static_site.bucket_regional_domain_name
}

