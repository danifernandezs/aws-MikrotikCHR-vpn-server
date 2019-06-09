// Time to deploy the Private Subnet

resource "aws_subnet" "mikrotik_chr_private_subnet" {
  vpc_id            = "${var.mikrotik_chr_vpc}"
  cidr_block        = "${var.private_subnet_cidr_block}"
  availability_zone = "${var.private_subnet_availability_zone}"

  tags = "${merge(
    var.common_tags,
    map(
      "Name", "${var.Private_Subnet_Name_Tag}",
      "Description", "${var.Private_Subnet_Description_Tag}"
    )
  )}"
}
