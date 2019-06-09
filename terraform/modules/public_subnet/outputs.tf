// Time to export some attributes

output "Deployed_Public_Subnet_ID" {
  description = "Time to export the Public Subnet ID"
  value       = "${aws_subnet.mikrotik_chr_public_subnet.id}"
}

output "Deployed_Public_Subnet_ARN" {
  description = "Time to export the Public Subnet ARN"
  value       = "${aws_subnet.mikrotik_chr_public_subnet.arn}"
}
