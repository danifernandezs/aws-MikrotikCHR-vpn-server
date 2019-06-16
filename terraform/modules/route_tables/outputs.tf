// Time to export some attributes
// Public Subnet Route Table

output "Deployed_Public_Subnet_Route_Table_ID" {
  description = "Time to export the Public Subnet Route Table ID"
  value       = "${aws_route_table.public_subnet_route_table.id}"
}
