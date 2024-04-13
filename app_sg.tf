# Create Application Security Group  

# SG application tier

resource "aws_security_group" "ssh-sg" {
  name        = "ssh access"
  description = "Allow SSH access on port 22"
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    description     = " SSH Access"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["${var.ssh-locate}"]  

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH security-group"
  }
}