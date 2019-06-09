// AWS Provider Variables
variable "aws_region" {
  description = "Desired AWS Region to Deploy this infrastructure"
}

variable "aws_credentials_profile" {
  description = "Profile name, from shared credentials file"
}

// Common Tags

variable "common_tags" {
  description = "Default common tags"
  type        = "map"

  default = {
    Environment = "Testing"
    Project     = "Mikrotik CHR"
    Managed_by  = "Terraform 0.11"
  }
}

// VPC Module Variables

variable "vpc_cidr_block" {
  description = "Desired CIDR Block for the VPC"
  default     = "10.0.0.0/16"
}

variable "enable_dns_on_vpc" {
  description = "Enable or not the dns support"
  default     = true
}

variable "enable_dns_hostnames_on_vpc" {
  description = "Enable or not the hostnames support"
  default     = true
}

// VPC Module Tags

variable "VPC_Name_Tag" {
  description = "Desired Name Tag for the VPC"
  default     = "Mikrotik CHR VPC"
}

variable "VPC_Description_Tag" {
  description = "Desired Description, as a tag"
  default     = "VPC where Mikrotik CHR is deployed"
}

// Public Subnet Module Variables

variable "public_subnet_cidr_block" {
  description = "Desired CIDR Block for the Public Subnet"
  default     = "10.0.0.0/17"
}

variable "public_subnet_availability_zone" {
  description = "Availability Zone for the Public Subnet"
}

// Public Subnet Module Tags

variable "Public_Subnet_Name_Tag" {
  description = "Desired Name Tag for the Public Subnet"
  default     = "Public Subnet - Mikrotik CHR"
}

variable "Public_Subnet_Description_Tag" {
  description = "Desired Description, as a tag"
  default     = "Public Subnet for the Mikrotik CHR"
}

// Private Subnet Module Variables

variable "private_subnet_cidr_block" {
  description = "Desired CIDR Block for the Private Subnet"
  default     = "10.0.128.0/17"
}

variable "private_subnet_availability_zone" {
  description = "Availability Zone for the Private Subnet"
}

// Public Subnet Module Tags

variable "Private_Subnet_Name_Tag" {
  description = "Desired Name Tag for the Private Subnet"
  default     = "Private Subnet - Mikrotik CHR"
}

variable "Private_Subnet_Description_Tag" {
  description = "Desired Description, as a tag"
  default     = "Private Subnet for the Mikrotik CHR"
}

// Internet Gateway Module

variable "Internet_Gateway_Name_Tag" {
  description = "Desired Name Tag for the Internet Gateway"
  default     = "Mikrotik CHR Internet Gateway"
}

variable "Internet_Gateway_Description_Tag" {
  description = "Desired Description, as a tag"
  default     = "Internet Gateway to attach it with the Public Subnets"
}

// Key Pair Module

variable "mikrotik_chr_key_pair_name" {
  description = "Desired name for the imported Public Key"
  default     = "Mikrotik CHR"
}

// Security Groups Module

// Segurity Group for the Public Subnet

variable "sg_public_subnet_name" {
  description = "Name for the Security Group that will be attached with the Public Subnet"
  default     = "SG - Public Mikrotik CHR"
}

variable "sg_public_subnet_description" {
  description = "Description for the Security Group that will be attached with the Public Subnet"
  default     = "Security Group Attached to the Mikrotik CHR Public Subnet"
}

variable "sg_public_subnet_revoke_rules" {
  description = "Allow Terraform to revoke all rules, ingress and egress"
  default     = true
}

variable "SG_Public_Subnet_Name_Tag" {
  description = "Name Tag for the Security Group that will be attached with the Public Subnet"
  default     = "Security Group - Public Subnet - Mikrotik CHR"
}

variable "SG_Public_Subnet_Description_Tag" {
  description = "Description Tag for the Security Group that will be attached with the Public Subnet"
  default     = "Security Group Attached to the Public Subnet, for Mikrotik CHR"
}

// Segurity Group for the Private Subnet

variable "sg_private_subnet_name" {
  description = "Name for the Security Group that will be attached with the Private Subnet"
  default     = "SG - Private Mikrotik CHR"
}

variable "sg_private_subnet_description" {
  description = "Description for the Security Group that will be attached with the Private Subnet"
  default     = "Security Group Attached to the Mikrotik CHR Private Subnet"
}

variable "sg_private_subnet_revoke_rules" {
  description = "Allow Terraform to revoke all rules, ingress and egress"
  default     = true
}

variable "SG_Private_Subnet_Name_Tag" {
  description = "Name Tag for the Security Group that will be attached with the Private Subnet"
  default     = "Security Group - Private Subnet - Mikrotik CHR"
}

variable "SG_Private_Subnet_Description_Tag" {
  description = "Description Tag for the Security Group that will be attached with the Private Subnet"
  default     = "Security Group Attached to the Private Subnet, for Mikrotik CHR"
}
