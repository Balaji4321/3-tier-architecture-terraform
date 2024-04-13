# EC2 instance web tier

resource "aws_instance" "web-server" {
  ami                    = "ami-0b5eea76982371e91 same"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.web-server-sg.id]
  subnet_id              = aws_subnet.web-pub-subnet-1.id
  user_data              = file("install_apache.sh")
  key_name               = "source_key"
  tags = {
    Name = "Web-asg"
  }

}

# EC2 instance app tier

resource "aws_instance" "app-prvt-server" {
  ami                    = "ami-0b5eea76982371e91 same"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids =  aws_security_group.ssh-sg.id
  subnet_id              = [aws_subnet.app-prvt-subnet-1.id]
  key_name               = "source_key"
  tags = {
    Name = "app-asg"
  }

}