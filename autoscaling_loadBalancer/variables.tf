variable "instance_type" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "cidr_block_public_subnet" {
  type = string
}
variable "cidr_block_private_subnet" {
  type = string
}

variable "availability_zone_public_subnet" {
  type = string
}
variable "availability_zone_private_subnet" {
  type = string
}