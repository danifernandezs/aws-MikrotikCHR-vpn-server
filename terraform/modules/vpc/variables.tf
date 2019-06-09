// Variables to deploy the VPC

variable "vpc_cidr_block" {
  description = "Desired CIDR Block for the VPC"
}

variable "enable_dns_on_vpc" {
  description = "Enable or not the dns support"
}

variable "enable_dns_hostnames_on_vpc" {
  description = "Enable or not the hostnames support"
}

// Common Tags

variable "common_tags" {
  description = "Default common tags"
  type        = "map"
}

// Tags

variable "VPC_Name_Tag" {
  description = "Desired Name Tag for the VPC"
}

variable "VPC_Description_Tag" {
  description = "Desired Description, as a tag"
}
