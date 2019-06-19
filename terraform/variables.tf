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

// Egress Rules for the Public Subnet

variable "sg_public_subnet_egress_world_description" {
  description = "Description for the egress rule, applied to the public subnet"
  default     = "Mikrotik CHR Public Subnet to the World"
}

// Egress Rules for the Private Subnet

variable "sg_private_subnet_egress_world_description" {
  description = "Description for the egress rule, applied to the private subnet"
  default     = "Mikrotik CHR Private Subnet to the World"
}

// Ingress Rules for the Public Subnet
// true or false as boolean

variable "allow_sg_public_subnet_ingress_shh" {
  description = "Enable/Disable SSH Rule, as boolean"
  default     = true
}

variable "sg_public_subnet_ingress_shh_description" {
  description = "Description for the ssh ingress rule"
  default     = "SSH Inbound Traffic"
}

variable "sg_public_subnet_ingress_shh_from_CIDR" {
  description = "Allow SSH traffic to this CIDR Block"
}

variable "allow_sg_public_subnet_ingress_web_ui" {
  description = "Enable/Disable WEBUI Rule, as boolean"
  default     = true
}

variable "sg_public_subnet_ingress_web_ui_description" {
  description = "Description for the web ui ingress rule"
  default     = "WebUI Inbound Traffic"
}

variable "sg_public_subnet_ingress_web_ui_from_CIDR" {
  description = "Allow WebUI traffic to this CIDR Block"
}

variable "allow_sg_public_subnet_ingress_winbox" {
  description = "Enable/Disable WINBOX Rule, as boolean"
  default     = true
}

variable "sg_public_subnet_ingress_winbox_description" {
  description = "Description for the winbox ingress rule"
  default     = "Winbox Inbound Traffic"
}

variable "sg_public_subnet_ingress_winbox_from_CIDR" {
  description = "Allow Winbox traffic to this CIDR Block"
}

variable "allow_sg_public_subnet_ingress_vpn" {
  description = "Enable/Disable VPN Rule, as boolean"
  default     = true
}

variable "sg_public_subnet_ingress_vpn_description" {
  description = "Description for the vpn ingress rule"
  default     = "VPN Inbound Traffic"
}

variable "sg_public_subnet_ingress_vpn_from_CIDR" {
  description = "Allow VPN traffic to this CIDR Block"
}

variable "sg_private_subnet_ingress_from_private_subnet_description" {
  description = "Description for the ingress rule, traffic from private subnet"
  default     = "All traffic from Private Subnet"
}

// Ingress Rules for the Private Subnet
variable "sg_private_subnet_ingress_from_mikrotik_description" {
  description = "Description for the ingress rule, applied to the private subnet"
  default     = "Allow all traffic from Mikrotik CHR"
}

// Route Tables Module

variable "public_subnet_route_table_Name_Tag" {
  description = "Name Tag for the Public Subnet Route Table"
  default     = "Public Subnet Route Table - To The World"
}

variable "public_subnet_route_table_Description_Tag" {
  description = "Description Tag for the Public Subnet Route Table"
  default     = "All traffic from Public Subnet to the world"
}

// Mikrotik CHR Module

// AMI, from marketplace
// https://aws.amazon.com/marketplace/pp/B01E00PU50

variable "mikrotik_chr_ami" {
  description = "The AMI to use for the instance"
}

variable "mikrotik_availability_zone" {
  description = "The AZ to start the instance in"
}

variable "mikrotik_chr_instance_type" {
  description = "The type of instance to start"
  default     = "t2.micro"
}

variable "mikrotik_chr_enable_disable_monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = true
}

variable "mikrotik_chr_volume_type" {
  description = "The type of volume"
  default     = "gp2"
}

variable "mikrotik_chr_volume_size" {
  description = "The size of the volume in gibibytes (GiB)"
  default     = 5
}

variable "mikrotik_chr_volume_delete_policy" {
  description = "Whether the volume should be destroyed on instance termination."
  default     = true
}

variable "Mikrotik_CHR_Instance_Name_Tag" {
  description = "Desired Name Tag for the Mikrotik CHR Instance"
  default     = "Mikrotik CHR"
}

variable "Mikrotik_CHR_Instance_Description_Tag" {
  description = "Desired Description, as a tag"
  default     = "Mikrotik CHR, used as VPN Server"
}

variable "Mikrotik_CHR_Instance_Volume_Name_Tag" {
  description = "Desired Name Tag for the Mikrotik CHR Instance Volume"
  default     = "Mikrotik CHR Volume"
}

variable "Mikrotik_CHR_Instance_Volume_Description_Tag" {
  description = "Desired Description, as a tag"
  default     = "Mikrotik CHR Volume, used as VPN Server"
}
