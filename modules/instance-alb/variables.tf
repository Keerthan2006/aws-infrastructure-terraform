variable "ami" {
  description = "enter ami id => defines os"
  type = string
}
variable "instance_type" {
  description = "enter instance type => defines RAM and cores"
  type = string
}
variable "key_name" {
  description = "enter the key value pair"
  type = string
}
variable "my_sg_id" {
  description = "enter the security group details"
}
variable "my_sn1_id" {
  description = "enter the subnet group"
}
variable "my_sn2_id" {
  description = "enter the subnet group"
}
variable "file_path_1" {
  description = "enter the path for instance 1"
}
variable "file_path_2" {
  description = "enter the path for instance 2"
}
variable "private_key_path" {
  description = "enter the path for instance 1"
}
variable "my_vpc" {
  description = "vpc for target groups"
}
