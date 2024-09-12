# Create EC2 Insatnce
resource "aws_instance" "my-ec2-vm" {
    ami = "ami-0182f373e66f89c85"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    tags = {
      name = "web"
    }   
  
}

