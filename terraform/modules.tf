// Time to load modules and deploy our desired infrastructure

// Time to create the Network
// VPC Module

module "deploy_vpc" {
  source                      = "modules/vpc"
  vpc_cidr_block              = "${var.vpc_cidr_block}"
  enable_dns_on_vpc           = "${var.enable_dns_on_vpc}"
  enable_dns_hostnames_on_vpc = "${var.enable_dns_hostnames_on_vpc}"

  // Common Tags
  common_tags = "${var.common_tags}"

  // VPC Tags
  VPC_Name_Tag        = "${var.VPC_Name_Tag}"
  VPC_Description_Tag = "${var.VPC_Description_Tag}"
}

// Time to create Subnets
// Public Subnet Module

module "deploy_public_subnet" {
  source                          = "modules/public_subnet"
  mikrotik_chr_vpc                = "${module.deploy_vpc.Deployed_VPC_ID}"
  public_subnet_cidr_block        = "${var.public_subnet_cidr_block}"
  public_subnet_availability_zone = "${var.public_subnet_availability_zone}"

  // Common Tags
  common_tags = "${var.common_tags}"

  // Public Subnet Tags
  Public_Subnet_Name_Tag        = "${var.Public_Subnet_Name_Tag}"
  Public_Subnet_Description_Tag = "${var.Public_Subnet_Description_Tag}"
}

// Private Subnet Module

module "deploy_private_subnet" {
  source                           = "modules/private_subnet"
  mikrotik_chr_vpc                 = "${module.deploy_vpc.Deployed_VPC_ID}"
  private_subnet_cidr_block        = "${var.private_subnet_cidr_block}"
  private_subnet_availability_zone = "${var.private_subnet_availability_zone}"

  // Common Tags
  common_tags = "${var.common_tags}"

  // Public Subnet Tags
  Private_Subnet_Name_Tag        = "${var.Private_Subnet_Name_Tag}"
  Private_Subnet_Description_Tag = "${var.Private_Subnet_Description_Tag}"
}

// We need an Internet Gateway
// Internet Gateway Module

module "deploy_internet_gateway" {
  source           = "modules/internet_gateway"
  mikrotik_chr_vpc = "${module.deploy_vpc.Deployed_VPC_ID}"

  // Common Tags
  common_tags = "${var.common_tags}"

  // Public Subnet Tags
  Internet_Gateway_Name_Tag        = "${var.Internet_Gateway_Name_Tag}"
  Internet_Gateway_Description_Tag = "${var.Internet_Gateway_Description_Tag}"
}

// Time to import Public Key

module "import_public_key" {
  source                     = "modules/key_pair"
  mikrotik_chr_key_pair_name = "${var.mikrotik_chr_key_pair_name}"
}

// Creating Security Groups

module "security_groups" {
  source           = "modules/security_groups"
  mikrotik_chr_vpc = "${module.deploy_vpc.Deployed_VPC_ID}"

  // Common Tags
  common_tags = "${var.common_tags}"

  // Segurity Group for the Public Subnet
  sg_public_subnet_name            = "${var.sg_public_subnet_name}"
  sg_public_subnet_description     = "${var.sg_public_subnet_description}"
  sg_public_subnet_revoke_rules    = true
  SG_Public_Subnet_Name_Tag        = "${var.SG_Public_Subnet_Name_Tag}"
  SG_Public_Subnet_Description_Tag = "${var.SG_Public_Subnet_Description_Tag}"

  // Segurity Group for the Private Subnet
  sg_private_subnet_name            = "${var.sg_private_subnet_name}"
  sg_private_subnet_description     = "${var.sg_private_subnet_description}"
  sg_private_subnet_revoke_rules    = true
  SG_Private_Subnet_Name_Tag        = "${var.SG_Private_Subnet_Name_Tag}"
  SG_Private_Subnet_Description_Tag = "${var.SG_Private_Subnet_Description_Tag}"

  // Egress Rules for the Public Subnet
  sg_public_subnet_egress_world_description = "${var.sg_public_subnet_egress_world_description}"

  // Egress Rules for the Private Subnet
  sg_private_subnet_egress_world_description = "${var.sg_private_subnet_egress_world_description}"

  // Ingress Rules for the Public Subnet
  allow_sg_public_subnet_ingress_shh                        = "${var.allow_sg_public_subnet_ingress_shh}"
  sg_public_subnet_ingress_shh_description                  = "${var.sg_public_subnet_ingress_shh_description}"
  sg_public_subnet_ingress_shh_from_CIDR                    = "${var.sg_public_subnet_ingress_shh_from_CIDR}"
  allow_sg_public_subnet_ingress_web_ui                     = "${var.allow_sg_public_subnet_ingress_web_ui}"
  sg_public_subnet_ingress_web_ui_description               = "${var.sg_public_subnet_ingress_web_ui_description}"
  sg_public_subnet_ingress_web_ui_from_CIDR                 = "${var.sg_public_subnet_ingress_web_ui_from_CIDR}"
  allow_sg_public_subnet_ingress_winbox                     = "${var.allow_sg_public_subnet_ingress_winbox}"
  sg_public_subnet_ingress_winbox_description               = "${var.sg_public_subnet_ingress_winbox_description}"
  sg_public_subnet_ingress_winbox_from_CIDR                 = "${var.sg_public_subnet_ingress_winbox_from_CIDR}"
  allow_sg_public_subnet_ingress_vpn                        = "${var.allow_sg_public_subnet_ingress_vpn}"
  sg_public_subnet_ingress_vpn_description                  = "${var.sg_public_subnet_ingress_vpn_description}"
  sg_public_subnet_ingress_vpn_from_CIDR                    = "${var.sg_public_subnet_ingress_vpn_from_CIDR}"
  sg_private_subnet_ingress_from_private_subnet_description = "${var.sg_private_subnet_ingress_from_private_subnet_description}"

  // Ingress Rules for the Private Subnet
  sg_private_subnet_ingress_from_mikrotik_description = "${var.sg_private_subnet_ingress_from_mikrotik_description}"
}

// Route Tables

module "route_tables" {
  source                           = "modules/route_tables"
  mikrotik_chr_vpc                 = "${module.deploy_vpc.Deployed_VPC_ID}"
  mikrotik_chr_internet_gateway_id = "${module.deploy_internet_gateway.Deployed_Internet_Gateway_ID}"

  // Common Tags
  common_tags = "${var.common_tags}"

  public_subnet_route_table_Name_Tag         = "${var.public_subnet_route_table_Name_Tag}"
  public_subnet_route_table_Description_Tag  = "${var.public_subnet_route_table_Description_Tag}"
  public_subnet_to_associate_the_route_table = "${module.deploy_public_subnet.Deployed_Public_Subnet_ID}"
}

// Elastic IP

module "elastic_ip" {
  source                   = "modules/instance_eip"
  mikrotik_chr_instance_id = "${module.mikrotik_chr_instance.Deployed_Mikrotik_CHR_Instance_ID}"
}

// Mikrotik CHR Instance

module "mikrotik_chr_instance" {
  source                                 = "modules/mikrotik_instance"
  mikrotik_chr_ami                       = "${var.mikrotik_chr_ami}"
  mikrotik_availability_zone             = "${var.mikrotik_availability_zone}"
  mikrotik_chr_instance_type             = "${var.mikrotik_chr_instance_type}"
  mikrotik_chr_enable_disable_monitoring = "${var.mikrotik_chr_enable_disable_monitoring}"
  mikrotik_chr_volume_type               = "${var.mikrotik_chr_volume_type}"
  mikrotik_chr_volume_size               = "${var.mikrotik_chr_volume_size}"
  mikrotik_chr_volume_delete_policy      = "${var.mikrotik_chr_volume_delete_policy}"
  mikrotik_chr_key_name                  = "${var.mikrotik_chr_key_pair_name}"

  mikrotik_chr_instance_security_group = "${module.security_groups.Deployed_SG_Public_Subnet_ID}"
  mikrotik_chr_instance_subnet_id      = "${module.deploy_public_subnet.Deployed_Public_Subnet_ID}"

  // Common Tags
  common_tags = "${var.common_tags}"

  Mikrotik_CHR_Instance_Name_Tag               = "${var.Mikrotik_CHR_Instance_Name_Tag}"
  Mikrotik_CHR_Instance_Description_Tag        = "${var.Mikrotik_CHR_Instance_Description_Tag}"
  Mikrotik_CHR_Instance_Volume_Name_Tag        = "${var.Mikrotik_CHR_Instance_Volume_Name_Tag}"
  Mikrotik_CHR_Instance_Volume_Description_Tag = "${var.Mikrotik_CHR_Instance_Volume_Description_Tag}"
}
