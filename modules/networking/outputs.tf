output "my_vpc_id" {
  value = aws_vpc.myvpc.id
}
output "my_subnet1_id" {
  value = aws_subnet.mysn1.id
}
output "my_subnet2_id" {
  value = aws_subnet.mysn2.id
}
output "my_sg_id" {
  value = aws_security_group.mysgs.id
}