resource "aws_route53_record" "www" {
  count=length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.app_server[count.index].private_ip]
}
resource "aws_route53_record" "aws"{
  count=length(var.domain)
  zone_id=var.zone_id
  name="${var.instances[count.index]}.${var.domain}"
  type="A"
  ttl=1
  records=[aws_instance.app_server[index(var.instances,"frontend")].public_ip]
}