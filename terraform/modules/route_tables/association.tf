// Associate Route Table with Public Subnet

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = "${var.public_subnet_to_associate_the_route_table}"
  route_table_id = "${aws_route_table.public_subnet_route_table.id}"
}
