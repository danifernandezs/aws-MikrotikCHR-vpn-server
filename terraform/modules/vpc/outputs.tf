// Time to export some attributes

output "Deployed_VPC_ID" {
  description = "Time to export the ID of the VPC"
  value       = "${aws_vpc.mikrotik_chr_vpc.id}"
}

output "Deployed_VPC_ARN" {
  description = "Time to export the ARN of the VPC"
  value       = "${aws_vpc.mikrotik_chr_vpc.arn}"
}
