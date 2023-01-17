# create EC2 instance in public subnet 1
resource "aws_instance" "demo_instance_public_1" {

  ami                    = var.ami_id
  vpc_security_group_ids = [var.ec2_security_group]
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.az.names[0]
  subnet_id              = var.public_subnet_az1
  key_name               = var.key_id

  tags = {
    "Name" = "${var.project_name}-instance"
  }
}

# create EC2 instance in public subnet 2
resource "aws_instance" "demo_instance_public_2" {

  ami                    = var.ami_id
  vpc_security_group_ids = [var.ec2_security_group]
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.az.names[1]
  subnet_id              = var.public_subnet_az2

  tags = {
    "Name" = "${var.project_name}-instance"
  }
}

# create EC2 instance in private subnet 1
resource "aws_instance" "demo_instance_private_1" {

  ami                    = var.ami_id
  vpc_security_group_ids = [var.ec2_security_group]
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.az.names[0]
  subnet_id              = var.private_app_subnet_az1

  tags = {
    "Name" = "${var.project_name}-instance"
  }
}

# create EC2 instance in private subnet 1
resource "aws_instance" "demo_instance_private_2" {

  ami                    = var.ami_id
  vpc_security_group_ids = [var.ec2_security_group]
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.az.names[0]
  subnet_id              = var.private_app_subnet_az2

  tags = {
    "Name" = "${var.project_name}-instance"
  }
}


# AZ
data "aws_availability_zones" "az" {}

# Create a new load balancer attachment
resource "aws_elb_attachment" "alb_attach_1" {
  elb      = var.alb_id
  instance = aws_instance.demo_instance_public_1.id
}

# Create a new load balancer attachment
resource "aws_elb_attachment" "alb_attach_2" {
  elb      = var.alb_id
  instance = aws_instance.demo_instance_public_2.id
}