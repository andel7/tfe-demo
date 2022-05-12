resource "aws_instance" "prod-server" {
  ami           = "ami-00c90dbdc12232b58"
  instance_type = "t3.micro"

  tags = {
    Name = "prod-server"
  }
}

resource "aws_security_group" "prod-sg" {
  name        = "prod-sg"
  description = "Allow inbound traffic"
  vpc_id      = "vpc-082db9842341c1010"

  ingress {
    description      = "TLS from allowed IPs"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [data.terraform_remote_state.allowed_ip.outputs.allowed_ips]
  }

  tags = {
    Name = "prod-sg"
  }
}