# 1. Create Hosted Zone
resource "aws_route53_zone" "R3-zone" {
  name = var.domain_name
}

resource "aws_route53_record" "R3-record" {
  allow_overwrite = true
  name            = var.domain_name
  ttl             = 172800
  type            = "NS"
  zone_id         = aws_route53_zone.R3-zone.zone_id

  records = [
    aws_route53_zone.R3-zone.name_servers[0],
    aws_route53_zone.R3-zone.name_servers[1],
    aws_route53_zone.R3-zone.name_servers[2],
    aws_route53_zone.R3-zone.name_servers[3],
  ]
}

# 2. Create "A" record
resource "aws_route53_record" "A_1" {
  zone_id = aws_route53_zone.R3-zone.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = "300"
  records = [aws_instance.web-server-instance-[0].public_ip]
}

resource "aws_route53_record" "A_2" {
  zone_id = aws_route53_zone.R3-zone.zone_id
  name    = var.www_domain_name
  type    = "A"
  ttl     = "300"
  records = [aws_instance.web-server-instance-[0].public_ip]
}