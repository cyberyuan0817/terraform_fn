provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}



resource "aws_acm_certificate" "us_east_1_cert" {
  provider          = aws.us-east-1
  domain_name       = "${var.domain_name}"
  validation_method = "DNS"

  subject_alternative_names = [
    "uat.${var.domain_name}",
    "${var.domain_name}",
    "www.${var.domain_name}"
  ]

  tags = {
    Name = "${var.prefix}-cloudfront-cert"
  }
}



resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.us_east_1_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  zone_id = var.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = 3600
  records = [each.value.record]
}

resource "aws_acm_certificate_validation" "cert" {
  provider                = aws.us-east-1
  certificate_arn         = aws_acm_certificate.us_east_1_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
