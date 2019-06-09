// Variables to deploy the Internet Gateway

// Common Tags

variable "common_tags" {
  description = "Default common tags"
  type        = "map"
}

// Tags

variable "Internet_Gateway_Name_Tag" {
  description = "Desired Name Tag for the Internet Gateway"
}

variable "Internet_Gateway_Description_Tag" {
  description = "Desired Description, as a tag"
}

// From VPC Module

variable "mikrotik_chr_vpc" {
  description = "The VPC ID, imported from VPC Module"
}
