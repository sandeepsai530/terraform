resource "aws_instance" "expense" {
  count                  = length(var.instance_name)
  //ami                    = data.aws_ami.joindevops.id
  ami = local.ami_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name    = local.instance_tags[count.index]
    purpose = "terraform-practice"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow inbound and outbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "terraform-sg"
  }
}