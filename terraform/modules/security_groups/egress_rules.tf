// Egress Rules for the Public Subnet

resource "aws_security_group_rule" "public_subnet_to_the_world" {
  description = "${var.sg_public_subnet_egress_world_description}"
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_public_subnet.id}"
}

// Egress Rules for the Private Subnet

resource "aws_security_group_rule" "private_subnet_to_the_world" {
  description = "${var.sg_private_subnet_egress_world_description}"
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private_subnet.id}"
}
