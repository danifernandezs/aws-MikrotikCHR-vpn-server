// Variables to create subnets route tables

variable "public_subnet_route_table_Name_Tag" {
  description = "Name Tag for the Public Subnet Route Table"
}

variable "public_subnet_route_table_Description_Tag" {
  description = "Description Tag for the Public Subnet Route Table"
}

// From Internet Gateway Module

variable "mikrotik_chr_internet_gateway_id" {
  description = "The Internet Gateway ID, imported from Internet Gateway Module"
}

// Common Tags

variable "common_tags" {
  description = "Default common tags"
  type        = "map"
}

// From VPC Module

variable "mikrotik_chr_vpc" {
  description = "The VPC ID, imported from VPC Module"
}

// From Public Subnet Module

variable "public_subnet_to_associate_the_route_table" {
  description = "The Public Subnet ID, imported from Public Subnet Module"
}
