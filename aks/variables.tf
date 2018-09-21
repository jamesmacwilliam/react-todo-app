variable "location" {
  default = "East US"
}

variable "dns_prefix" {
  default = "tododemo"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "admin_username" {
  default = "deploy"
}

variable "client_id" {}

variable "client_secret" {}

variable "docker_username" {}

variable "resource_group_name" {}

variable "cluster_name" {}

variable "cksum" {}

variable "inc" {}
