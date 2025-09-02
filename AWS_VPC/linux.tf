resource "aws_instance" "linux" {
    subnet_id = aws_subnet.private_subnet.id
    ami = var.linux-ami
    instance_type = var.instance_type_t3_micro
    key_name = aws_key_pair.pavan_key.key_name
    vpc_security_group_ids = [aws_security_group.Linux_SG.id]
    ebs_block_device{
        device_name = "/dev/xvda"
        volume_size = 30
        volume_type = "gp3"
    }

    tags = {
        Name = "${random_pet.pavan_pet.id}-linux"
    }

  
}