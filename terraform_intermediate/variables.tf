variable "vpc_cidr" {
  type = string
  
}

variable "cidr_block_public" {
  type = string
}

variable "availability_zone_public" {
  type = string
}

variable "cidr_block_private" {
  type = string
}

variable "availability_zone_private" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair" {
  type = string
}