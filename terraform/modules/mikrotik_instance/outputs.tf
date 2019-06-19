// Time to export some attributes

output "Deployed_Mikrotik_CHR_Instance_ID" {
  description = "Time to export the ID for the Mikrotik CHR Instance"
  value       = "${aws_instance.mikrotik_chr_instance.id}"
}

output "Deployed_Mikrotik_CHR_Instance_ARN" {
  description = "Time to export the ARN for the Mikrotik CHR Instance"
  value       = "${aws_instance.mikrotik_chr_instance.arn}"
}

output "Deployed_Mikrotik_CHR_Instance_PUBLIC_DNS" {
  description = "Time to export the Public DNS for the Mikrotik CHR Instance"
  value       = "${aws_instance.mikrotik_chr_instance.public_dns}"
}
