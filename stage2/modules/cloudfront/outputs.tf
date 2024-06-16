output "cloudfront_prod_distribution_id" {
  value = aws_cloudfront_distribution.prod_frontend.id
}

output "cloudfront_prod_domain_name" {
  value = aws_cloudfront_distribution.prod_frontend.domain_name
}



output "cloudfront_uat_domain_name" {
  value = aws_cloudfront_distribution.uat_frontend.domain_name
}

output "cloudfront_uat_distribution_id" {
  value = aws_cloudfront_distribution.uat_frontend.id
}



output "cloudfront_zone_id" {
  value = data.aws_cloudfront_distribution.cf_info.hosted_zone_id
}