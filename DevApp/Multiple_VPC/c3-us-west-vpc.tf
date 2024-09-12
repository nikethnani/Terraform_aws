resource "aws_vpc" "vpc-us-west-1" {
    cidr_block = "10.2.0.0/16"
    provider = aws.aws-west-1
    tags = {
      name="vpc-us-west-1"
    }
}