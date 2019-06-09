// Variables to create security groups

// Segurity Group for the Public Subnet

variable "sg_public_subnet_name" {
  description = "Name for the Security Group that will be attached with the Public Subnet"
}

variable "sg_public_subnet_description" {
  description = "Description for the Security Group that will be attached with the Public Subnet"
}

variable "sg_public_subnet_revoke_rules" {
  description = "Allow Terraform to revoke all rules, ingress and egress"
}

variable "SG_Public_Subnet_Name_Tag" {
  description = "Name Tag for the Security Group that will be attached with the Public Subnet"
}

variable "SG_Public_Subnet_Description_Tag" {
  description = "Description Tag for the Security Group that will be attached with the Public Subnet"
}

// Segurity Group for the Private Subnet

variable "sg_private_subnet_name" {
  description = "Name for the Security Group that will be attached with the Private Subnet"
}

variable "sg_private_subnet_description" {
  description = "Description for the Security Group that will be attached with the Private Subnet"
}

variable "sg_private_subnet_revoke_rules" {
  description = "Allow Terraform to revoke all rules, ingress and egress"
}

variable "SG_Private_Subnet_Name_Tag" {
  description = "Name Tag for the Security Group that will be attached with the Private Subnet"
}

variable "SG_Private_Subnet_Description_Tag" {
  description = "Description Tag for the Security Group that will be attached with the Private Subnet"
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
