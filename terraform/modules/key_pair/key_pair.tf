// We need to add our key pair to associate with the instance

resource "aws_key_pair" "mikrotik_chr_key_pair" {
  key_name   = "${var.mikrotik_chr_key_pair_name}"
  public_key = "${file("${path.root}/.aws/mikrotik.pub")}"
}
