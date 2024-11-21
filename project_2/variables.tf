

variable "force_destroy" {
    type = bool
}
variable "environment" {
  type = set(string)
}
variable "region" {
  type = string
}
variable "outbound" {
  type = string
} 
variable "inbound" {
  type = string
}
# variable "owner_email" {
#   type = bool
# }
