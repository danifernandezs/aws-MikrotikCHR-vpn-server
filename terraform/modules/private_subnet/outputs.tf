// Time to export some attributes

output "Deployed_Private_Subnet_ID" {
  description = "Time to export the Private Subnet ID"
  value       = "${aws_subnet.mikrotik_chr_private_subnet.id}"
}

output "Deployed_Private_Subnet_ARN" {
  description = "Time to export the Private Subnet ARN"
  value       = "${aws_subnet.mikrotik_chr_private_subnet.arn}"
}
