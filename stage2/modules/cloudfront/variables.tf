variable "subdomain" {
  description = "Subdomain for the CloudFront distribution"
  type        = string
}

variable "domain_name" {
  description = "Root domain name"
  type        = string
}

variable "s3_bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  type        = string
}

variable "s3_bucket_id" {
  description = "ID of the S3 bucket"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
}

variable "zone_id" {
  description = "Route53 zone ID"
  type        = string
}
