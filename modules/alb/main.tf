# Security Group del ALB: permite HTTP desde Internet
resource "aws_security_group" "alb_sg" {
  name        = "${var.name}-sg"
  description = "Security group for ALB"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Permitir que la APP reciba HTTP SOLO desde el SG del ALB
resource "aws_security_group_rule" "app_http_from_alb" {
  type                     = "ingress"
  description              = "HTTP from ALB"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = var.app_sg_id
  source_security_group_id = aws_security_group.alb_sg.id
}

# Application Load Balancer
resource "aws_lb" "this" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnet_ids
}

# Target Group (destino: la instancia EC2 de la APP)
resource "aws_lb_target_group" "this" {
  name        = "${var.name}-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    protocol = "HTTP"
    port     = "traffic-port"
    path     = "/"
  }
}

# Listener HTTP:80 → forward al target group
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

# Attachment: engancha tu EC2 App al target group
resource "aws_lb_target_group_attachment" "app" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.target_instance_id
  port             = 80
}
