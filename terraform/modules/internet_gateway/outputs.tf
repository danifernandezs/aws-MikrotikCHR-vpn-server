// Time to export some attributes

output "Deployed_Internet_Gateway_ID" {
  description = "Time to export the Internet Gateway ID"
  value       = "${aws_internet_gateway.mikrotik_chr_internet_gateway.id}"
}
