resource "aws_route53_record" "expense" {
    count = 3
  zone_id = var.zone_id
  name    = "${var.instance[count.index]}.${var.domain_name}"  #interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.ec2_info[count.index].private_ip]
}