resource "aws_instance" "expense" {
  #count                  = length(var.instance_name)
  #ami                    = data.aws_ami.joindevops.id
  #ami = local.ami_id
  for_each = var.instance_name
  ami = "ami-09c813fb71547fc4f"
  instance_type         = each.value
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    #Name    = local.instance_tags[count.index]
    Name = each.key
    purpose = "terraform-practice"
  }

  provisioner "local-exec" {
    command =  "echo ${self.public_ip} >> inventory"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo install nginx -y",
        "sudo systemctl start nginx",
     ]
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

output "ec2_info" {
  value = aws_instance.expense
}