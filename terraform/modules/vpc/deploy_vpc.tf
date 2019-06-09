// Deploying a VPC

resource "aws_vpc" "mikrotik_chr_vpc" {
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_support   = "${var.enable_dns_on_vpc}"
  enable_dns_hostnames = "${var.enable_dns_hostnames_on_vpc}"

  tags = "${merge(
    var.common_tags,
    map(
      "Name", "${var.VPC_Name_Tag}",
      "Description", "${var.VPC_Description_Tag}"
    )
  )}"
}
