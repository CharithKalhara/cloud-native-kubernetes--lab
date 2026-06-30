variable "region" {
  default = "ap-southeast-1"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "ssh_public_key" {
  description = "Public SSH key for EC2 access"
  type        = string
  sensitive   = true
}