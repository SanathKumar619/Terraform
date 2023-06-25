provider "aws" {

}
variable "sg" {
}

locals {
a = "t2.micro"
}
resource "aws_instance" "my" {

  ami           = "ami-022e1a32d3f742bd8"
  instance_type = local.a
  count         = 3
  vpc_security_group_ids = var.sg
  tags = {
    Name = "Sanath-${count.index}"
  }
}

output "public-ip" {
value=aws_instance.my[0].public_ip
}
