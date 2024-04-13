# web app load balancer

resource "aws_lb" "app-load-balancer" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group.id]
  subnets            = [aws_subnet.web-pub-subnet-1.id, aws_subnet.web-pub-subnet-2.id]
  enable_deletion_protection = false
  tags = {
   Name = "App load balancer"
  }
}


resource "aws_lb_target_group" "alb-target-group" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id
}


resource "aws_lb_target_group_attachment" "web-attachment" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = aws_instance.web-server.id 
  port             = 80

}



# create listener port 80 with redirect action

resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.app-load-balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "redirect"
    
    redirect{
     port  = 443
     protocol = "HTTPS"
     status_code = "HTTP-301"
   }
  }
}
