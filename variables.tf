variable "keypair_name" {
  type = string
}


# Instance name for tagging the Windows server
variable "instance_name" {
  description = "Name tag for the Windows server instance"
  type        = string
  default = "Metasploit"
}

variable "instance_name2" {
  description = "Name tag for the instance"
  type = string
  default = "MarlinSpike"
}

variable "instance_name3" {
  description = "Name tag for the instance"
  type = string
  default = "Windows-Server"
}

variable "instance_name4" {
  description = "Name tag for the instance"
  type = string
  default = "KaliLinux"
}
