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

// Egress Rules for the Public Subnet

variable "sg_public_subnet_egress_world_description" {
  description = "Description for the egress rule, applied to the public subnet"
}

// Egress Rules for the Private Subnet

variable "sg_private_subnet_egress_world_description" {
  description = "Description for the egress rule, applied to the private subnet"
}

// Ingress Rules for the Public Subnet
// SSH, VPN, WebUI and Winbox
// true or false as boolean

variable "allow_sg_public_subnet_ingress_shh" {
  description = "Enable/Disable SSH Rule, as boolean"
}

variable "sg_public_subnet_ingress_shh_description" {
  description = "Description for the ssh ingress rule"
}

variable "sg_public_subnet_ingress_shh_from_CIDR" {
  description = "Allow SSH traffic to this CIDR Block"
}

variable "allow_sg_public_subnet_ingress_web_ui" {
  description = "Enable/Disable WEBUI Rule, as boolean"
}

variable "sg_public_subnet_ingress_web_ui_description" {
  description = "Description for the web ui ingress rule"
}

variable "sg_public_subnet_ingress_web_ui_from_CIDR" {
  description = "Allow WebUI traffic to this CIDR Block"
}

variable "allow_sg_public_subnet_ingress_winbox" {
  description = "Enable/Disable WINBOX Rule, as boolean"
}

variable "sg_public_subnet_ingress_winbox_description" {
  description = "Description for the winbox ingress rule"
}

variable "sg_public_subnet_ingress_winbox_from_CIDR" {
  description = "Allow Winbox traffic to this CIDR Block"
}

variable "allow_sg_public_subnet_ingress_vpn" {
  description = "Enable/Disable VPN Rule, as boolean"
}

variable "sg_public_subnet_ingress_vpn_description" {
  description = "Description for the vpn ingress rule"
}

variable "sg_public_subnet_ingress_vpn_from_CIDR" {
  description = "Allow VPN traffic to this CIDR Block"
}

variable "sg_private_subnet_ingress_from_private_subnet_description" {
  description = "Description for the ingress rule, traffic from private subnet"
}

// Ingress Rules for the Private Subnet
// Allow all traffic from the Mikrotik Subnet
variable "sg_private_subnet_ingress_from_mikrotik_description" {
  description = "Description for the ingress rule, applied to the private subnet"
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
