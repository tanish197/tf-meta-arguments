terraform {
   required_providers {
        aws = {
           source = "hashicorp/aws"
           version = "~>4.16"
           }
      }
required_version = ">= 1.2.0"
}


provider "aws" {
   region = "ap-south-1"
   access_key = "AKIA3I7IIDOERITCMZXA"
   secret_key = "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"
}

/* locals {
      instances = toset(["Tanish", "Sanjana", "Neha", "Navdeep"])
} 
*/


locals {
      instances = {"Tanish":"ami-0f5ee92e2d63afc18", "Sanjana":"ami-0ff1768d0d7c69c2a",
                   "Neha":"ami-0f5ee92e2d63afc18", "Navdeep":"ami-0ff1768d0d7c69c2a"}
}




resource "aws_instance" "my_ec2_instance" {
     for_each = local.instances
    // ami = "ami-0f5ee92e2d63afc18"
     ami = each.value
     instance_type = "t2.micro"
     tags=  {
       Name = each.key
        
}
}
 
/*
output "instance_infomation" {
  value = {
     Public_IP = aws_instance.my_ec2_instance[*].public_ip,
     Private_IP = aws_instance.my_ec2_instance[*].private_ip,
     DNS =  aws_instance.my_ec2_instance[*].public_dns,
     VPC =  aws_instance.my_ec2_instance[*].vpc_security_group_ids
}
}
*/
