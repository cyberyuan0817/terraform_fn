variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}



variable "domain_name" {
  description = "Root domain name"
  type        = string
}

variable "cloudfront_prod_domain_name" {
  description = "Domain name of the CloudFront distribution"
  type        = string
}


variable "cloudfront_uat_domain_name" {
  description = "Domain name of the CloudFront distribution"
  type        = string
}

variable "cloudfront_zone_id" {
  description = "Hosted zone ID of the CloudFront distribution"
  type        = string
}

variable "subdomain" {
  description = "Subdomain for the CloudFront distribution"
  type        = string
}