// Using the AWS Provider
provider "aws" {
  shared_credentials_file = ".aws/credentials"
  region                  = "${var.aws_region}"
  profile                 = "${var.aws_credentials_profile}"
  version                 = "~> 2.12"
}
