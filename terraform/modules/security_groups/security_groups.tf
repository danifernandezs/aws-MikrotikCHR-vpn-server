// Security Group for the Public Subnet

resource "aws_security_group" "sg_public_subnet" {
  name                   = "${var.sg_public_subnet_name}"
  description            = "${var.sg_public_subnet_description}"
  revoke_rules_on_delete = "${var.sg_public_subnet_revoke_rules}"

  // From VPC module
  vpc_id = "${var.mikrotik_chr_vpc}"

  tags = "${merge(
    var.common_tags,
    map(
      "Name", "${var.SG_Public_Subnet_Name_Tag}",
      "Description", "${var.SG_Public_Subnet_Description_Tag}"
    )
  )}"
}

// Security Group for the Private Subnet

resource "aws_security_group" "sg_private_subnet" {
  name                   = "${var.sg_private_subnet_name}"
  description            = "${var.sg_private_subnet_description}"
  revoke_rules_on_delete = "${var.sg_private_subnet_revoke_rules}"

  // From VPC module
  vpc_id = "${var.mikrotik_chr_vpc}"

  tags = "${merge(
    var.common_tags,
    map(
      "Name", "${var.SG_Private_Subnet_Name_Tag}",
      "Description", "${var.SG_Private_Subnet_Description_Tag}"
    )
  )}"
}
