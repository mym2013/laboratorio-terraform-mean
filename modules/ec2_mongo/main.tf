resource "aws_instance" "mongo" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y mongodb-org
              systemctl enable mongod
              systemctl start mongod
              EOF

  tags = {
    Name = "ec2-mongo"
  }
}

