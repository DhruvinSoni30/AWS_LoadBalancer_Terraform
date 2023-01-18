# alb security group id
output "alb_security_group_id" {
  value = aws_security_group.alb_security_group.id
}

# public ec2 security group id
output "public_ec2_security_group_id" {
  value = aws_security_group.public_ec2_security_group.id
}  

# private ec2 security group id
output "private_ec2_security_group_id" {
  value = aws_security_group.private_ec2_security_group.id
}  

# bastion host security group id
output "bastion_host_security_group_id" {
  value = aws_security_group.bastion_host_security_group.id
}  