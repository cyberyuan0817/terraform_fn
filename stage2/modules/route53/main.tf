
data "aws_route53_zone" "host_web_address" {
  name = "${var.domain_name}"
}






resource "aws_route53_record" "frontend_prod_www" {
  zone_id = data.aws_route53_zone.host_web_address.zone_id 
  name    = "${var.subdomain}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_prod_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }


}

resource "aws_route53_record" "frontend_prod" {
  zone_id = data.aws_route53_zone.host_web_address.zone_id 
  name    = "${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_prod_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }


}



resource "aws_route53_record" "frontend_uat" {
  zone_id = data.aws_route53_zone.host_web_address.zone_id 
  name    = "uat.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_uat_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }

}