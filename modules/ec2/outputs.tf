# Getting Public IP of EC2 instance
output "public_ip_1" {
  value = aws_instance.demo_instance_public_1.public_ip
}

output "public_ip_2" {
  value = aws_instance.demo_instance_public_2.public_ip
}

# Getting Private IP of EC2 instance
output "private_ip_1" {
  value = aws_instance.demo_instance_private_1.private_ip
}

output "private_ip_2" {
  value = aws_instance.demo_instance_private_2.private_ip
}

# Getting ID of EC2 instance

output "instance_id_1" {
  value = aws_instance.demo_instance_public_1.id
}

output "instance_id_2" {
  value = aws_instance.demo_instance_public_2.id
}