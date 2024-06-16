variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "subdomain" {
  description = "Subdomain for the CloudFront distribution"
  type        = string
}

variable "domain_name" {
  description = "Root domain name"
  type        = string
}


variable "dynamodb_table" {
  description = "The name of the DynamoDB table for Terraform state locking"
  type        = string
}