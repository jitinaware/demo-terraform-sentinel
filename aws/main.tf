

resource "aws_security_group" "tfesen" {
  name = "tfesen"
  vpc_id = data.aws_vpc.primary-vpc.id
  egress = [
    {
      cidr_blocks      = [ var.aws_allow_cidr_range, ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ var.aws_allow_cidr_range, ]
     description      = "ssh rule"
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  },
  ]
}


resource "aws_instance" "tfesen" {
  count = var.resource_count
  ami = data.aws_ami.ami_os_filter.id
  instance_type = var.aws_instance_type
  #key_name = var.aws_keyname

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 40
  }

  vpc_security_group_ids = [aws_security_group.tfesen.id]

  tags = var.resource_tags

  volume_tags = var.resource_tags

  depends_on = [aws_security_group.tfesen]
}



