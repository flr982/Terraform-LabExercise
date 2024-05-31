resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = merge(
    var.common_tags,
    {
      Name = "Main VPC ${var.project} ${var.aws_region} ${var.env}"
    }
  )
}

resource "aws_subnet" "subnets" {
  for_each = { for y, cidr in var.subnet_cidrs : y => cidr }

  vpc_id     = aws_vpc.main.id
  cidr_block = each.value
  # availability_zone = "${var.aws_region}.${each.key}"

  tags = merge(
    var.common_tags,
    {
      Name = "Subnet ${var.env} ${each.key + 1}"
    }
  )
}

resource "aws_security_group" "sgs" {
  for_each = var.security_groups

  name        = each.key
  description = "Security Group ${each.key}"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = each.value.ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr_blocks]
    }
  }

  dynamic "egress" {
    for_each = each.value.egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = [egress.value.cidr_blocks]
    }
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}_${var.aws_region}_${var.env}_sg"
    }
  )
}
