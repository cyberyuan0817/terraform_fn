variable "domain_name" {
  description = "The domain name for the ACM certificate"
  type        = string
}

variable "zone_id" {
  description = "The ID of the Route 53 hosted zone"
  type        = string
}

variable "prefix" {
  description = "Resource name prefix"
  type        = string
}

variable "subdomain" {
  description = "The subdomain to use"
  type        = string
  default     = "www"
}