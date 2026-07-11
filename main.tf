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