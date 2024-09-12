resource "aws_instance" "ec2_app" {
  ami                    = "ami-0182f373e66f89c85"
  instance_type          = "t2.micro"
  key_name               = "Ec2-Instance"
  subnet_id              = aws_subnet.vpc_public_subnet.id
  vpc_security_group_ids = [aws_security_group.vpc_security_group.id]
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF
  tags = {

    name = "app"
  }

}







