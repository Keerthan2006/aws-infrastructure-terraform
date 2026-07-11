variable "region" {
  description = "specify the aws region"
  type = string
}
variable "cidr" {
  description = "enter the cidr block range of your vpc"
  type = string
}
variable "subnet1" {
  description = "enter the cidr range for subnet 1"
  type = string
}
variable "subnet2" {
  description = "enter the cidr range for subnet 1"
  type = string
}
variable "az1" {
  description = "specify the availability zone for subnet 1"
  type = string
}
variable "az2" {
  description = "specify the availability zone for subnet 1"
  type = string
}
variable "port1" {
  description = "enter ssh port"
  type = number
}
variable "port2" {
  description = "enter http port"
  type = number
}
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
variable "file_path_1" {
  description = "enter the path for instance 1"
}
variable "file_path_2" {
  description = "enter the path for instance 2"
}
variable "private_key_path" {
  description = "enter the path for instance 1"
}