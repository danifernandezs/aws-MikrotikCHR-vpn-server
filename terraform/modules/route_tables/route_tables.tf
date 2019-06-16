// Public Subnet Route Table
// Public Subnet to the World

resource "aws_route_table" "public_subnet_route_table" {
  // From VPC module
  vpc_id = "${var.mikrotik_chr_vpc}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.mikrotik_chr_internet_gateway_id}"
  }

  tags = "${merge(
    var.common_tags,
    map(
      "Name", "${var.public_subnet_route_table_Name_Tag}",
      "Description", "${var.public_subnet_route_table_Description_Tag}"
    )
  )}"
}

// Private Subnet Route Table
// For this POC, we don't need it

