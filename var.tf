variable "region" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "public-1a_cidr_block" {
  type = string
}

variable "public-1b_cidr_block" {
  type = string
}

variable "private-1a_cidr_block" {
  type = string
}

variable "private-1b_cidr_block" {
  type = string
}

variable "db-1a_cidr_block" {
  type = string
}

variable "db-1b_cidr_block" {
  type = string
}

variable "azs" {
  type = list(string)
}

