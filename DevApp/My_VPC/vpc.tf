#Resource-1 Create vpc 
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "vpc-dev"
  }
}

#Resource-2 Create subnets
resource "aws_subnet" "vpc_public_subnet" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    name = "public_subnet"

  }
}

#Create Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc-dev.id
  tags = {
    name = "IGW"
  }

}

#Create route table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc-dev.id


}

#create route table
resource "aws_route" "aws_route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.IGW.id


}

#assosiate route table with subnets 
resource "aws_route_table_association" "vpc_route_table_association" {
  route_table_id = aws_route_table.route_table.id
  subnet_id      = aws_subnet.vpc_public_subnet.id

}

# create security group

resource "aws_security_group" "vpc_security_group" {
  vpc_id      = aws_vpc.vpc-dev.id
  name        = "dev_vpc_security_group"
  description = "Dev vpc default security group"

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}



   