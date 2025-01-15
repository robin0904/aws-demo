provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region
}

# # Security group to allow RDP access
# resource "aws_security_group" "master" {
#   vpc_id = "vpc-0d8bd3b1fae7497ca"

#   # Allow SSH access (port 22)
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # Allow DCV access (port 8444)
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 3389
#     to_port     = 3389
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # Egress rule to allow all outbound traffic
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "Master-SG"
#   }
# }

# # Generate an SSH key pair
# resource "tls_private_key" "master_key_gen" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# # Create the Key Pair
# resource "aws_key_pair" "master_key_pair" {
#   key_name   = var.keypair_name
#   public_key = tls_private_key.master_key_gen.public_key_openssh
# }

# # Metasploit Server instance with dynamic username and session setup
# resource "aws_instance" "Metasploit" {
#   ami               = "ami-0f6d9f901bbe83896"  # Replace with your desired CentOS AMI ID
#   instance_type     = "t3a.medium"            # Replace with your desired instance type
#   key_name          = aws_key_pair.master_key_pair.key_name
#   subnet_id         = "subnet-090f51c9318322eeb"
#   availability_zone = "ap-south-1a"
#   vpc_security_group_ids = [aws_security_group.master.id]

#   tags = {
#     Name = "${var.instance_name}"
#   }
# }

# # Save the private key locally
# resource "local_file" "local_key_pair" {
#   filename        = "${var.instance_name}.pem"
#   file_permission = "0400"
#   content         = tls_private_key.master_key_gen.private_key_pem
# }

# # Output the Metasploit Server Public IP
# output "Metasploit_Server_Public_IP" {
#   value = aws_instance.Metasploit.public_ip
#   depends_on = [ aws_instance.Metasploit ]
# }

# # MarlinSpike Server instance with dynamic username and session setup
# resource "aws_instance" "MarlinSpike" {
#   ami               = "ami-031799a944a78f0ae"  # Replace with your desired CentOS AMI ID
#   instance_type     = "t3a.medium"            # Replace with your desired instance type
#   key_name          = aws_key_pair.master_key_pair.key_name
#   subnet_id         = "subnet-090f51c9318322eeb"
#   availability_zone = "ap-south-1b"
#   vpc_security_group_ids = [aws_security_group.master.id]

#   tags = {
#     Name = "${var.instance_name2}"
#   }
# }

# # Save the private key locally
# resource "local_file" "local_key_pair2" {
#   filename        = "${var.instance_name2}.pem"
#   file_permission = "0400"
#   content         = tls_private_key.master_key_gen.private_key_pem
# }

# # Output the MarlinSpike Server Public IP
# output "MarlinSpike_Server_Public_IP" {
#   value = aws_instance.MarlinSpike.public_ip
#   depends_on = [ aws_instance.MarlinSpike ]
# }

# # Windows Server instance with dynamic username and session setup
# resource "aws_instance" "Windows-Server" {
#   ami               = "ami-08c7b1b96cec6b75e"  # Replace with your desired CentOS AMI ID
#   instance_type     = "t3a.medium"            # Replace with your desired instance type
#   key_name          = aws_key_pair.master_key_pair.key_name
#   subnet_id         = "subnet-090f51c9318322eeb"
#   availability_zone = "ap-south-1b"
#   vpc_security_group_ids = [aws_security_group.master.id]

#   tags = {
#     Name = "${var.instance_name3}"
#   }
# }

# # Save the private key locally
# resource "local_file" "local_key_pair3" {
#   filename        = "${var.instance_name3}.pem"
#   file_permission = "0400"
#   content         = tls_private_key.master_key_gen.private_key_pem
# }

# # Output the Windows-Server Server Public IP
# output "Windows_Server_Server_Public_IP" {
#   value = aws_instance.Windows-Server.public_ip
#   depends_on = [ aws_instance.Windows-Server ]
# }

# # KaliLinux instance with dynamic username and session setup
# resource "aws_instance" "KaliLinux" {
#   ami               = "ami-0ce5862ea490b6e2a"  # Replace with your desired CentOS AMI ID
#   instance_type     = "t3a.medium"            # Replace with your desired instance type
#   key_name          = aws_key_pair.master_key_pair.key_name
#   subnet_id         = "subnet-090f51c9318322eeb"
#   availability_zone = "ap-south-1b"
#   vpc_security_group_ids = [aws_security_group.master.id]

#   tags = {
#     Name = "${var.instance_name4}"
#   }
# }

# # Save the private key locally
# resource "local_file" "local_key_pair4" {
#   filename        = "${var.instance_name4}.pem"
#   file_permission = "0400"
#   content         = tls_private_key.master_key_gen.private_key_pem
# }

# # Output the KaliLinux Server Public IP
# output "KaliLinux_Server_Public_IP" {
#   value = aws_instance.KaliLinux.public_ip
#   depends_on = [ aws_instance.KaliLinux ]
# }

# Security Group
resource "aws_security_group" "master" {
  vpc_id = "vpc-0d8bd3b1fae7497ca"

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # RDP access
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # DCV access
  ingress {
    from_port   = 8444
    to_port     = 8444
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # All outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Master-SG"
  }
}

# Key Generation
resource "tls_private_key" "master_key_gen" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "master_key_pair" {
  key_name   = var.keypair_name
  public_key = tls_private_key.master_key_gen.public_key_openssh
}

# Metasploit Instances
resource "aws_instance" "Metasploit" {
  count             = var.metasploit_instance_count
  ami               = "ami-0f6d9f901bbe83896"
  instance_type     = "t3a.medium"
  key_name          = aws_key_pair.master_key_pair.key_name
  subnet_id         = "subnet-090f51c9318322eeb"
  availability_zone = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.master.id]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.instance_name}-${count.index + 1}"
  }
}

# MarlinSpike Instances
resource "aws_instance" "MarlinSpike" {
  count             = var.marlinspike_instance_count
  ami               = "ami-031799a944a78f0ae"
  instance_type     = "t3a.medium"
  key_name          = aws_key_pair.master_key_pair.key_name
  subnet_id         = "subnet-090f51c9318322eeb"
  availability_zone = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.master.id]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.instance_name2}-${count.index + 1}"
  }
}

# Windows Server Instances
resource "aws_instance" "Windows-Server" {
  count             = var.windows_instance_count
  ami               = "ami-08c7b1b96cec6b75e"
  instance_type     = "t3a.medium"
  key_name          = aws_key_pair.master_key_pair.key_name
  subnet_id         = "subnet-090f51c9318322eeb"
  availability_zone = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.master.id]
  get_password_data = true

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.instance_name3}-${count.index + 1}"
  }
}

# Kali Linux Instances
resource "aws_instance" "KaliLinux" {
  count             = var.kali_instance_count
  ami               = "ami-0ce5862ea490b6e2a"
  instance_type     = "t3a.medium"
  key_name          = aws_key_pair.master_key_pair.key_name
  subnet_id         = "subnet-090f51c9318322eeb"
  availability_zone = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.master.id]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.instance_name4}-${count.index + 1}"
  }
}

# Save private keys locally
resource "local_file" "private_key_files" {
  count           = max(var.metasploit_instance_count, var.marlinspike_instance_count, var.windows_instance_count, var.kali_instance_count)
  filename        = "instance-key-${count.index + 1}.pem"
  file_permission = "0400"
  content         = tls_private_key.master_key_gen.private_key_pem
}

# Outputs
output "Metasploit_Server_Public_IPs" {
  value = aws_instance.Metasploit[*].public_ip
}

output "MarlinSpike_Server_Public_IPs" {
  value = aws_instance.MarlinSpike[*].public_ip
}

output "Windows_Server_Public_IPs" {
  value = aws_instance.Windows-Server[*].public_ip
}

output "Windows_Server_Passwords" {
  value     = aws_instance.Windows-Server[*].password_data
  sensitive = true
}

output "KaliLinux_Server_Public_IPs" {
  value = aws_instance.KaliLinux[*].public_ip