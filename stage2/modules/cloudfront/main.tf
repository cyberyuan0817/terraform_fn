resource "aws_cloudfront_distribution" "prod_frontend" {
  origin {
    domain_name = var.s3_bucket_domain_name
    origin_id   = "S3-${var.s3_bucket_id}"
    origin_path = "/out"  # Specify the origin path here
    custom_origin_config {
        http_port              = 80
        https_port             = 80
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for ${var.domain_name} and its subdomain"
  default_root_object = "index.html"

  aliases = ["${var.subdomain}.${var.domain_name}",
  "${var.domain_name}"
  
  ]

  default_cache_behavior {
    target_origin_id       = "S3-${var.s3_bucket_id}"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method  = "sni-only"
  }
}





resource "aws_cloudfront_distribution" "uat_frontend" {
  origin {
    domain_name = var.s3_bucket_domain_name
    origin_id   = "S3-${var.s3_bucket_id}"
    origin_path = "/uatout"  # Specify the origin path here
    custom_origin_config {
        http_port              = 80
        https_port             = 80
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for ${var.domain_name} and its subdomain"
  default_root_object = "index.html"

  aliases = ["uat.${var.domain_name}"]

  default_cache_behavior {
    target_origin_id       = "S3-${var.s3_bucket_id}"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method  = "sni-only"
  }
}


data "aws_cloudfront_distribution" "cf_info" {
  id = aws_cloudfront_distribution.prod_frontend.id 
}


