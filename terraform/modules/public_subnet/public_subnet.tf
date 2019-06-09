// Time to deploy the Public Subnet

resource "aws_subnet" "mikrotik_chr_public_subnet" {
  vpc_id            = "${var.mikrotik_chr_vpc}"
  cidr_block        = "${var.public_subnet_cidr_block}"
  availability_zone = "${var.public_subnet_availability_zone}"

  tags = "${merge(
    var.common_tags,
    map(
      "Name", "${var.Public_Subnet_Name_Tag}",
      "Description", "${var.Public_Subnet_Description_Tag}"
    )
  )}"
}
