// Time to export some attributes
// Security Group for the Public Subnet

output "Deployed_SG_Public_Subnet_ID" {
  description = "Time to export the Security Group Public Subnet ID"
  value       = "${aws_security_group.sg_public_subnet.id}"
}

output "Deployed_SG_Public_Subnet_ARN" {
  description = "Time to export the Security Group Public Subnet ARN"
  value       = "${aws_security_group.sg_public_subnet.arn}"
}

// Security Group for the Private Subnet

output "Deployed_SG_Private_Subnet_ID" {
  description = "Time to export the Security Group Private Subnet ID"
  value       = "${aws_security_group.sg_private_subnet.id}"
}

output "Deployed_SG_Private_Subnet_ARN" {
  description = "Time to export the Security Group Private Subnet ARN"
  value       = "${aws_security_group.sg_private_subnet.arn}"
}
