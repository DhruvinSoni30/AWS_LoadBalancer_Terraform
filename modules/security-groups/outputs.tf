# alb security group id
output "alb_security_group_id" {
  value = aws_security_group.alb_security_group.id
}

# ec2 security group id
output "ec2_security_group_id" {
  value = aws_security_group.ec2_security_group.id
}  