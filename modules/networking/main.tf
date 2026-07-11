# vpc
resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}
# subnet 1
resource "aws_subnet" "mysn1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subnet1
  availability_zone = var.az1
  map_public_ip_on_launch = true
}
# subnet 2
resource "aws_subnet" "mysn2" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subnet2
  availability_zone = var.az2
  map_public_ip_on_launch = true
}
# igw
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
}
# rt
resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}
# rt and subnet association
resource "aws_route_table_association" "rtsn1" {
  subnet_id = aws_subnet.mysn1.id
  route_table_id = aws_route_table.myrt.id
}
resource "aws_route_table_association" "rtsn2" {
  subnet_id = aws_subnet.mysn2.id
  route_table_id = aws_route_table.myrt.id
}
# security groups
resource "aws_security_group" "mysgs" {
  name = "terraform-security"
  vpc_id = aws_vpc.myvpc.id
  ingress {
    from_port = var.port1
    to_port = var.port1
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }
  ingress {
    from_port = var.port2
    to_port = var.port2
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}