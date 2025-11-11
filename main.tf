resource "aws_security_group" "main" {
  vpc_id = var.vpc_id
  name = "${var.project}-${var.env}-${var.name}"
  dynamic "ingress" {
    for_each = toset(var.ingress_ports)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow inbound on port ${ingress.value}"
    }
  }

  dynamic "egress" {
    for_each = toset(var.egress_ports)
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow outbound on port ${egress.value}"
    }
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project}-${var.env}-sg"
    }
  )
}