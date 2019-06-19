// Time to deploy the Mikrotik CHR Instance

resource "aws_instance" "mikrotik_chr_instance" {
  ami                    = "${var.mikrotik_chr_ami}"
  availability_zone      = "${var.mikrotik_availability_zone}"
  instance_type          = "${var.mikrotik_chr_instance_type}"
  key_name               = "${var.mikrotik_chr_key_name}"
  monitoring             = "${var.mikrotik_chr_enable_disable_monitoring}"
  vpc_security_group_ids = ["${var.mikrotik_chr_instance_security_group}"]
  subnet_id              = "${var.mikrotik_chr_instance_subnet_id}"

  root_block_device {
    volume_type           = "${var.mikrotik_chr_volume_type}"
    volume_size           = "${var.mikrotik_chr_volume_size}"
    delete_on_termination = "${var.mikrotik_chr_volume_delete_policy}"
  }

  tags = "${merge(
    var.common_tags,
    map(
      "Name", "${var.Mikrotik_CHR_Instance_Name_Tag}",
      "Description", "${var.Mikrotik_CHR_Instance_Description_Tag}"
    )
  )}"

  volume_tags = "${merge(
    var.common_tags,
    map(
      "Name", "${var.Mikrotik_CHR_Instance_Volume_Name_Tag}",
      "Description", "${var.Mikrotik_CHR_Instance_Volume_Description_Tag}"
    )
  )}"
}
