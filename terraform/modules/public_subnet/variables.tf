// Variables to deploy the Public Subnet

variable "public_subnet_cidr_block" {
  description = "Desired CIDR Block for the Public Subnet"
}

variable "public_subnet_availability_zone" {
  description = "Availability Zone for the Public Subnet"
}

// Common Tags

variable "common_tags" {
  description = "Default common tags"
  type        = "map"
}

// Tags

variable "Public_Subnet_Name_Tag" {
  description = "Desired Name Tag for the Public Subnet"
}

variable "Public_Subnet_Description_Tag" {
  description = "Desired Description, as a tag"
}

// From VPC Module

variable "mikrotik_chr_vpc" {
  description = "The VPC ID, imported from VPC Module"
}
