// Time to deploy the needed Internet Gateway

resource "aws_internet_gateway" "mikrotik_chr_internet_gateway" {
  vpc_id = "${var.mikrotik_chr_vpc}"

  tags = "${merge(
    var.common_tags,
    map(
      "Name", "${var.Internet_Gateway_Name_Tag}",
      "Description", "${var.Internet_Gateway_Description_Tag}"
    )
  )}"
}
