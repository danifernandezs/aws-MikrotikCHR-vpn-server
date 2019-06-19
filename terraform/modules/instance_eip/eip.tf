// Allocate an Elastic IP

resource "aws_eip" "eip_for_mikrotik" {
  vpc = true
}
