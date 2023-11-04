
resource "aws_vpc" "vpc" {
  cidr_block           = "198.162.0.0/16"
  enable_dns_hostnames = true
}
