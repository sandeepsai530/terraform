resource "aws_route53_record" "expense" {
    count = 3
  zone_id = var.zone_id
  name    = "${var.instance[count.index]}.${var.domain_name}"  #interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip]
}

resource "aws_route53_record" "expense" {
  zone_id = var.zone_id
  name    = "${var.instance[2]}.${var.domain_name}"  #interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[2].public_ip]
}