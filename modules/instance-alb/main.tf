resource "aws_instance" "myinstance1" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [var.my_sg_id]
  subnet_id = var.my_sn1_id
  connection {
    host = self.public_ip
    private_key = file(var.private_key_path) # path of your key
    type = "ssh"
    user = "ubuntu"
  }
  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"

     ]
  }
  provisioner "file" {
    source = var.file_path_1
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {
    inline = [ 
      "sudo mv /tmp/index.html /var/www/html/index.html"
     ]
  }


}
resource "aws_instance" "myinstance2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [var.my_sg_id]
  subnet_id = var.my_sn2_id
  connection {
    host = self.public_ip
    private_key = file(var.private_key_path) # path of your key
    type = "ssh"
    user = "ubuntu"
  }
  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"

     ]
  }
  provisioner "file" {
    source = var.file_path_2
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {
    inline = [ 
      "sudo mv /tmp/index.html /var/www/html/index.html"
     ]
  }
}
# ALB
resource "aws_lb" "myalb" {
  name = "myalb1"
  internal = false
  load_balancer_type = "application"
  security_groups = [var.my_sg_id]
  subnets = [var.my_sn1_id,var.my_sn2_id]
  tags = {
    Name = "web"
  }
}
# TGs
resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.my_vpc
  health_check {
    port = "traffic-port"
    path = "/"
  }
}
# TGs and Instance
resource "aws_lb_target_group_attachment" "tg1" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.myinstance1.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "tg2" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.myinstance2.id
  port             = 80
}
resource "aws_lb_listener" "mylistener" {
  load_balancer_arn = aws_lb.myalb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.test.arn
    type = "forward"
  }
}
output "alb_dns" {
  value = aws_lb.myalb.dns_name
}