# Variables
variable "keypair_name" {
  description = "Name of the keypair to be created"
  type        = string
  default     = "master-key"
}

variable "instance_name" {
  description = "Name tag for Metasploit instance"
  type        = string
  default     = "Metasploit-Server"
}

variable "instance_name2" {
  description = "Name tag for MarlinSpike instance"
  type        = string
  default     = "MarlinSpike-Server"
}

variable "instance_name3" {
  description = "Name tag for Windows instance"
  type        = string
  default     = "Windows-Server"
}

variable "instance_name4" {
  description = "Name tag for Kali Linux instance"
  type        = string
  default     = "KaliLinux-Server"
}

variable "metasploit_instance_count" {
  description = "Number of Metasploit instances to launch"
  type        = number
  default     = 2
}

variable "marlinspike_instance_count" {
  description = "Number of MarlinSpike instances to launch"
  type        = number
  default     = 2
}

variable "windows_instance_count" {
  description = "Number of Windows instances to launch"
  type        = number
  default     = 2
}

variable "kali_instance_count" {
  description = "Number of Kali Linux instances to launch"
  type        = number
  default     = 2
}