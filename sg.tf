resource "aws_security_group" "sg" {
  name = "my-sg"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.ports
    iterator = any
    content {
      from_port   = any.value
      to_port     = any.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "sg_id" {
value = aws_security_group.sg.id
}
