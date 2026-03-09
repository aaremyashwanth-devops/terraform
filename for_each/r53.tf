resource "aws_route53_record" "www"{
    for_each=aws_instance.app_server
    zone_id=var.zone_id
    name="${each.key}.${var.domain}"
    type="A"
    ttl=1
    records=[each.value.private_ip]
    allow_overwrite=true
}

resource "aws_route53_record" "www"{
    zone_id=var.zone_id
    name="roboshop.${var.domain}"
    type="A"
    ttl=1
    records=[lookup(aws_instance.app_server,"frontend").public_ip]
    allow_overwrite=true
}