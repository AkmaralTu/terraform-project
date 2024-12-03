variable "cidr_block" {
  type = string
}

variable "cidr_blocks_public_subnet" {
  # type = list(string)
}
variable "availability_zones_public_subnet" {
  # type = list(string)
}

variable "cidr_block_private_subnet" {
  type = string
}
variable "availability_zone_private_subnet" {
  type = string
}
