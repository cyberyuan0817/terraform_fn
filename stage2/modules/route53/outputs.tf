output "record_name" {
  value = aws_route53_record.frontend_prod.name
}

output "route53_zone_id" {
  value = data.aws_route53_zone.host_web_address.zone_id 
}
