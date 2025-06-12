resource "aws_security_group" "dev_security_group" {
    name = "${var.project}-${var.environment}-${var.sg_name}"
    description = var.description

    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "-1"
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }

    egress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "-1"
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }

    tags = {
      Name = "${var.project}-${var.environment}-${var.sg_name}"
    }
  
}

resource "aws_instance" "roboshop_dev_instances" {
  count = length(var.instances)
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids  = [aws_security_group.dev_security_group.id]


tags = merge(var.common_tags,
{
    Name = "${var.project}-${var.instances[count.index]} - ${var.environment}"
    Version = 1.0
    Component = var.instances[count.index]
    Environment = var.environment
}
)
}