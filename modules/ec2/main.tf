resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}_${var.aws_region}_${var.env}_ec2"
    }
  )
}
