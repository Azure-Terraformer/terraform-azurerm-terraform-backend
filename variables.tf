variable "location" {
  type = string
}
variable "resource_group_prefix" {
  type    = string
  default = "tf"
}
variable "storage_prefix" {
  type    = string
  default = "tf"
}
variable "random_length" {
  type    = number
  default = 8
}
variable "storage_replication_type" {
  type    = string
  default = "LRS"
}
variable "storage_container_name" {
  type    = string
  default = "tfstate"
}
