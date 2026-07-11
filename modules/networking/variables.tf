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