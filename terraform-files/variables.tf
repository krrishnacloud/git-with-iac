variable "region" {
  type = string
  description = "AWS region"
  default     = "ap-south-1"
}

variable "instance_type" {
  type = string
  description = "EC2_instance"
  default = "t2.micro"
}
variable "ami" {
  type = string
  default = "ami-019715e0d74f695be"
}


