data "aws_vpc" "primary-vpc" {
    default = true
}

data "aws_ami" "ami_os_filter" {
     most_recent = true

     filter {
        name   = "name"
        values = [var.amifilter_osname]
     }
     filter {
        name = "architecture"
        values = [var.amifilter_osarch]

 }

     filter {
       name   = "virtualization-type"
       values = [var.amifilter_osvirtualizationtype]

 }

     owners = [var.amifilter_owner] 

 }
