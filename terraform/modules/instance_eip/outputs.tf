// Time to export some attributes

output "Allocated_EIP_ID" {
  description = "Time to export the Allocated Elastic IP ID"
  value       = "${aws_eip.eip_for_mikrotik.id}"
}

output "Allocated_EIP_PublicIP" {
  description = "Time to export the Allocated Public IP"
  value       = "${aws_eip.eip_for_mikrotik.public_ip}"
}
