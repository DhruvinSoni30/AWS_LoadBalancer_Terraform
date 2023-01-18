variable "public_ec2_security_group" {}
variable "private_ec2_security_group" {}
variable "bastion_host_security_group" {}
variable "ami_id" {}
variable "instance_type" {}
variable "public_subnet_az1" {}
variable "project_name" {}
variable "public_subnet_az2" {}
variable "private_app_subnet_az1" {}
variable "private_app_subnet_az2" {}
variable "alb_id" {}
variable "key_id" {}
variable "private_key" {
  default = "/Users/dhruvins/Desktop/AWS_LoadBalancer_Terraform/modules/key_pair/tests.pem"
}