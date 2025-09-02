resource "aws_security_group" "windows_sg" {
    name = "windows-${random_pet.pavan_pet.id}-sg"
    description = "Allows RDP,HTTP and HTTPS"
    vpc_id = aws_vpc.vpc-01.id

    ingress{
        description = "Allows inbound RDP 3389"
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_blocks = ["${local.home_ip}/32"]
    }
    ingress{
        description = "Allows inbound HTTP 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.all_ipv4_cidr]

    }
    ingress{
        description = "Allows inbound HTTPS 80"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [var.all_ipv4_cidr]

    }
    egress{
        description = "Allows all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.all_ipv4_cidr]
    }

     tags = {
    Name = "windows-${random_pet.pavan_pet.id}-sg"  
  }

  
}


resource "aws_security_group" "Linux_SG"{
    name = "${random_pet.pavan_pet.id}-Linux_SG"
    description = "Allows SSH and MySQL"
    vpc_id = aws_vpc.vpc-01.id

    ingress {
        description = "Allows inbound SSH 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${aws_instance.Windows.private_ip}/32"]
    }
    ingress {
        description = "Allows inbound MySQL 3306"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["${aws_instance.Windows.private_ip}/32"]
    }
    egress {
        description = "Allows all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.all_ipv4_cidr]
    }
}    