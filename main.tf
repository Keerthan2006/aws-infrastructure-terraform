module "networking" {
  source = "./modules/networking"
  cidr = var.cidr
  subnet1 = var.subnet1
  subnet2 = var.subnet2
  az1 = var.az1
  az2 = var.az2
  port1 = var.port1
  port2 = var.port2
}
module "instance-alb" {
  source = "./modules/instance-alb"
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  my_sg_id = module.networking.my_sg_id
  my_sn1_id = module.networking.my_subnet1_id
  my_sn2_id = module.networking.my_subnet2_id
  private_key_path = var.private_key_path
  file_path_1 = var.file_path_1
  file_path_2 = var.file_path_2
  my_vpc = module.networking.my_vpc_id
}
output "albdns" {
  value = module.instance-alb.alb_dns
}