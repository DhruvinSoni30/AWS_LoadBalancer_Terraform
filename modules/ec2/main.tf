# create EC2 instance in public subnet 1
resource "aws_instance" "demo_instance_public_1" {

  ami                    = var.ami_id
  vpc_security_group_ids = [var.ec2_security_group]
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.az.names[0]
  subnet_id              = var.public_subnet_az1
  key_name               = var.key_id

  tags = {
    "Name" = "${var.project_name}-public-instance"
  }


  provisioner "remote-exec" {

    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install docker -y",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user",
      "sudo chkconfig docker on",
      "sudo yum install -y git",
      "sudo chmod 666 /var/run/docker.sock",
      "docker pull dhruvin30/dhsoniweb:v1",
      "docker run -d -p 80:80 dhruvin30/dhsoniweb:v1"   
  ]
 }

  connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = file(var.private_key)
      host     = self.public_ip
      port        = 22
    }
}

# create EC2 instance in public subnet 2
resource "aws_instance" "demo_instance_public_2" {

  ami                    = var.ami_id
  vpc_security_group_ids = [var.ec2_security_group]
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.az.names[1]
  subnet_id              = var.public_subnet_az2
  key_name               = var.key_id

  tags = {
    "Name" = "${var.project_name}-public-instance-2"
  }

  provisioner "remote-exec" {

    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install docker -y",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user",
      "sudo chkconfig docker on",
      "sudo yum install -y git",
      "sudo chmod 666 /var/run/docker.sock",
      "docker pull dhruvin30/dhsoniweb:v1",
      "docker run -d -p 80:80 dhruvin30/dhsoniweb:v1"   
  ]
 }

   connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = file(var.private_key)
      host     = self.public_ip
      port        = 22
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
    "Name" = "${var.project_name}-private-instance"
  }
}

# create EC2 instance in private subnet 2
resource "aws_instance" "demo_instance_private_2" {

  ami                    = var.ami_id
  vpc_security_group_ids = [var.ec2_security_group]
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.az.names[1]
  subnet_id              = var.private_app_subnet_az2

  tags = {
    "Name" = "${var.project_name}-private-instance-2"
  }
}


# AZ
data "aws_availability_zones" "az" {}
