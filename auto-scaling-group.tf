
# ASG for persentation tier 

resource "aws_launch_template" "auto-scaling-group" {
  name_prefix   = "auto-scaling-group"
  image_id      = "ami.......same ec2"
  instance_type = "t2.micro"
  user_data = file(install-apache.sh)
  key_name = "source_key"
  network_interfaces {
    subnet_id = aws_subnet.web-pub-subnet-1.id
    security_groups = [aws_security_group.web-server-sg.id]
  }
}


resource "aws_autoscaling_group" "asg-1" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

    launch_template {
        id = aws_launch_template.auto-scaling-group.id
        version = "$Latest"
      }
}


# ASG for application tier


 resource "aws_launch_template" "auto-scaling-group-prvt" {
  name_prefix   = "auto-scaling-group"
  image_id      = "ami...same ec2"
  instance_type = "t2.micro"
  user_data = file("install-apache.sh")
  key_name = "source_key"
  network_interfaces {
    subnet_id = aws_subnet.app-prvt-subnet-1.id
    security_groups = [aws_security_group.ssh-sg.id]
  }
}
resource "aws_autoscaling_group" "asg-2" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

    launch_template {
        id = aws_launch_template.auto-scaling-group-prvt.id
        version = "$Latest"
      }
}
