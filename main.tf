provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region
}

# security group
resource "aws_security_group" "master" {
  vpc_id = "vpc-0d8bd3b1fae7497ca"

# port 22 for ssh conection
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
# port 3306 for db connection
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# open to all
  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    self = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # "-1" represents all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "tls_private_key" "master-key-gen" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair of kali linux didnt have software
resource "aws_key_pair" "master-key-pair" {
  key_name   = var.keypair_name 
  public_key = tls_private_key.master-key-gen.public_key_openssh
}

# Kali rdp
resource "aws_instance" "kali_server" {
  ami           = "ami-0ce5862ea490b6e2a"  # Replace with your desired AMI ID
  instance_type = "t3a.2xlarge"  # Replace with your desired instance type
  key_name      = aws_key_pair.master-key-pair.key_name
  subnet_id = "subnet-090f51c9318322eeb"
  availability_zone = "ap-south-1b"
  
  security_groups = [aws_security_group.master.id]
  
  tags = {
    Name = var.instance_name1
  }
}

# Metasploit
resource "aws_instance" "metasploit" {
  ami           = "ami-0f6d9f901bbe83896"  # Replace with your desired AMI ID
  instance_type = "t3a.small"  # Replace with your desired instance type
  key_name      = aws_key_pair.master-key-pair.key_name
  subnet_id = "subnet-090f51c9318322eeb"
  availability_zone = "ap-south-1b"

  security_groups = [aws_security_group.master.id]
  
  tags = {
    Name = var.instance_name2
  }
}

# Basic Pentesting (marlinspike)
resource "aws_instance" "basic_pentesting" {
  ami           = "ami-031799a944a78f0ae"  # Replace with your desired AMI ID
  instance_type = "t3a.small"  # Replace with your desired instance type
  key_name      = aws_key_pair.master-key-pair.key_name
  subnet_id = "subnet-090f51c9318322eeb"
  availability_zone = "ap-south-1b"

  security_groups = [aws_security_group.master.id]
  
  tags = {
    Name = var.instance_name4
  }
}

# Exploitable Windows
resource "aws_instance" "Windows-10-Pro" {
  ami           = "ami-08c7b1b96cec6b75e"  # Replace with your desired AMI ID
  instance_type = "t3.medium"  # Replace with your desired instance type
  key_name      = aws_key_pair.master-key-pair.key_name
  subnet_id = "subnet-090f51c9318322eeb"
  availability_zone = "ap-south-1b"

  security_groups = [aws_security_group.master.id]

  tags = {
    Name = var.instance_name3
  }
}

resource "local_file" "local_key_pair" {
  filename = "${var.keypair_name}.pem"
  file_permission = "0400"
  content = tls_private_key.master-key-gen.private_key_pem
}

output "pem_file_for_ssh" {
  value = tls_private_key.master-key-gen.private_key_pem
  sensitive = true
}

output "kali_server" {
  value = aws_instance.kali_server.private_ip
}

output "metasploit" {
  value = aws_instance.metasploit.private_ip
}

output "metasploit_user_and_password" {
  value = "vagrant"
}

output "marlinspike" {
  value = aws_instance.basic_pentesting.private_ip
}

output "marlinspike_user_and_password" {
  value = "marlinspike"
}

output "exploitable_Windows" {
  value = aws_instance.Windows-10-Pro.private_ip
}
output "exploitable_Windows_Username" {
  value = "Administrator"
}
output "exploitable_Windows_Password" {
  value = "password@123"
}


