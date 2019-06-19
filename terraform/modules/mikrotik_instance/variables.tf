// Variables to deploy the Mikrotik CHR Instance

variable "mikrotik_chr_ami" {
  description = "The AMI to use for the instance"
}

variable "mikrotik_availability_zone" {
  description = "The AZ to start the instance in"
}

variable "mikrotik_chr_instance_type" {
  description = "The type of instance to start"
}

variable "mikrotik_chr_enable_disable_monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
}

// Root Block Device

variable "mikrotik_chr_volume_type" {
  description = "The type of volume"
}

variable "mikrotik_chr_volume_size" {
  description = "The size of the volume in gibibytes (GiB)"
}

variable "mikrotik_chr_volume_delete_policy" {
  description = "Whether the volume should be destroyed on instance termination."
}

// Tags

variable "Mikrotik_CHR_Instance_Name_Tag" {
  description = "Desired Name Tag for the Mikrotik CHR Instance"
}

variable "Mikrotik_CHR_Instance_Description_Tag" {
  description = "Desired Description, as a tag"
}

// Volume Tags

variable "Mikrotik_CHR_Instance_Volume_Name_Tag" {
  description = "Desired Name Tag for the Mikrotik CHR Instance Volume"
}

variable "Mikrotik_CHR_Instance_Volume_Description_Tag" {
  description = "Desired Description, as a tag"
}

// Common Tags

variable "common_tags" {
  description = "Default common tags"
  type        = "map"
}

// From Key Pair Module - Previous Variable

variable "mikrotik_chr_key_name" {
  description = "The key name of the Key Pair to use for the instance"
}

// From Security Groups Module

variable "mikrotik_chr_instance_security_group" {
  description = "Security Group ID to associate with"
}

// From Public Subnet Module

variable "mikrotik_chr_instance_subnet_id" {
  description = "The subnet ID where the deploy the instance"
}
