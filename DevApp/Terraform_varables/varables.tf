#Input Varables
variable "aws_region" {
    description = " Region in which AWS resources to be created"
    type = string
    default = "us-east-1" 
}

variable "ec2_ami_id" {
    type = string
    description = "ami-id"
    default = "ami-0e86e20dae9224db8" 
}

variable "ec2_instance_count" {
    description = "Instnace_Count"
    type = number
    default = 1
  
}