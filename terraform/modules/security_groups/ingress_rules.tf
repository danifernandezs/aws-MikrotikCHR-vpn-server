// Ingress Rules for the Public Subnet

resource "aws_security_group_rule" "allow_ssh_to_chr" {
  count       = "${var.allow_sg_public_subnet_ingress_shh}"
  description = "${var.sg_public_subnet_ingress_shh_description}"
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [ "${var.sg_public_subnet_ingress_shh_from_CIDR}" ]

  security_group_id = "${aws_security_group.sg_public_subnet.id}"
}

resource "aws_security_group_rule" "allow_web_ui_chr" {
  count       = "${var.allow_sg_public_subnet_ingress_web_ui}"
  description = "${var.sg_public_subnet_ingress_web_ui_description}"
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = [ "${var.sg_public_subnet_ingress_web_ui_from_CIDR}" ]

  security_group_id = "${aws_security_group.sg_public_subnet.id}"
}

resource "aws_security_group_rule" "allow_winbox_chr" {
  count       = "${var.allow_sg_public_subnet_ingress_winbox}"
  description = "${var.sg_public_subnet_ingress_winbox_description}"
  type        = "ingress"
  from_port   = 8291
  to_port     = 8291
  protocol    = "tcp"
  cidr_blocks = [ "${var.sg_public_subnet_ingress_winbox_from_CIDR}" ]

  security_group_id = "${aws_security_group.sg_public_subnet.id}"
}

resource "aws_security_group_rule" "allow_vpn_chr" {
  count       = "${var.allow_sg_public_subnet_ingress_vpn}"
  description = "${var.sg_public_subnet_ingress_vpn_description}"
  type        = "ingress"
  from_port   = 1194
  to_port     = 1194
  protocol    = "tcp"
  cidr_blocks = [ "${var.sg_public_subnet_ingress_vpn_from_CIDR}" ]

  security_group_id = "${aws_security_group.sg_public_subnet.id}"
}

resource "aws_security_group_rule" "allow_private_subnet_to_mikrotik" {
  description = "${var.sg_private_subnet_ingress_from_private_subnet_description}"
  type        = "ingress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  source_security_group_id = "${aws_security_group.sg_public_subnet.id}"

  security_group_id = "${aws_security_group.sg_public_subnet.id}"
}

// Ingress Rules for the Private Subnet
// Allow all traffic from the Mikrotik Subnet

resource "aws_security_group_rule" "allow_miktrotik_to_private_subnet" {
  description = "${var.sg_private_subnet_ingress_from_mikrotik_description}"
  type        = "ingress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  source_security_group_id = "${aws_security_group.sg_public_subnet.id}"

  security_group_id = "${aws_security_group.sg_private_subnet.id}"
}
