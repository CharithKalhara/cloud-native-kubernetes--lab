data "aws_route53_zone" "main" {
  name         = "charithkalhara.me"
  private_zone = false
}

resource "aws_route53_record" "kubernetes" {
  zone_id = data.aws_route53_zone.main.zone_id

  name = "kubernetes.charithkalhara.me"
  type = "A"
  ttl  = 300

  records = [
    aws_instance.kubernetes.public_ip
  ]
}