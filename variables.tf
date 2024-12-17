variable "location" {
  type = string
}
variable "name" {
  type = string
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
variable "state_container_name" {
  type    = string
  default = "tfstate"
}
variable "plan_container_name" {
  type    = string
  default = "tfplan"
}
variable "tags" {
  type    = map(string)
  default = {}
}
