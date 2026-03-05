variable "region" {
  type = string
  description = "AWS region"
}

variable "instance_type" {
  type = string
  description = "EC2_instance"
  default = "t2.micro"
}
variable "ami" {
  type = string
  description = "ami-019715e0d74f695be"
}
