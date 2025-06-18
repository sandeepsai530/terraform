resource "aws_instance" "expense" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "terraform-ec2"
  }
  }  

  resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description = "Allow inbound and outbound traffic"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      name = "terraform-sg"
    }
  }