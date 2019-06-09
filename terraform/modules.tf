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
  source = "modules/key_pair"
  mikrotik_chr_key_pair_name = "${var.mikrotik_chr_key_pair_name}"
}
