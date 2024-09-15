#Input Varibles
resource "aws_instance" "my-ec2-vm" {
  ami = var.ec2_ami_id #Ubuntu
  instance_type = "t2.micro"
  key_name = "Ec2-Instance"
  count = 1
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
EOF

vpc_security_group_ids = [ aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id ]
    tags = {
      name = "myec2vm"
    }
}

