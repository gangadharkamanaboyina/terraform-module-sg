variable "project" {
  type = string
}

variable "env" {
  type = string
}

variable "name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpc_id" {
  type = string
}

variable "ingress_ports" {
  type = list(number)
  default = []
}

variable "egress_ports" {
  type    = list(number)
  default = [0]
}