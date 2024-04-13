# Create web Security Group  

# SG presentation tier

resource "aws_security_group" "web-server-sg" {
  name        = "Web-SG"
  description = "Allow HTTP/HTTPS access on port 80/443 via Alb and SSH via SSH-SG"
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = ["${aws_security_group.alb-security-group.id}"]
    
  }
  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = ["${aws_security_group.alb-security-group.id}"]
    
  }
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = ["${aws_security_group.ssh-sg.id}"]
    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-server-sg"
  }
}

