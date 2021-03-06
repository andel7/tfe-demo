resource "aws_instance" "dev-server" {
  ami           = "ami-00c90dbdc12232b58"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.dev-sg.id]
  tags = {
    Name = "dev-server"
  }
  root_block_device {
    encrypted = true
  }
  monitoring = true
  ebs_optimized = true
  metadata_options {
    http_tokens = "required"
    http_endpoint = "enabled"
  }
}

resource "aws_security_group" "dev-sg" {
  name        = "dev-sg"
  description = "Allow inbound traffic"
  vpc_id      = "vpc-082db9842341c1010"

  ingress {
    description      = "TLS from allowed IPs"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = data.terraform_remote_state.allowed_ip.outputs.allowed_ips
  }

  tags = {
    Name = "dev-sg"
  }
}