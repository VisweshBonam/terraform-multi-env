variable "sg_name" {
  default = "security_group"
}

variable "description" {
  default = "roboshop dev security group"
}

variable "from_port" {
  default = 0
}

variable "to_port" {
  default = 0
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
  default = ["::/0"]
}

variable "common_tags" {
  default = {
    Project   = "Roboshop"
    Terraform = true
  }
}

variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "project_name" {
  default = "roboshop"
}

variable "instances" {
  default = ["mongodb", "redis"]
}

variable "instance_type" {
  default = {
    dev  = "t3.micro"
    prod = "t3.small"
  }
}