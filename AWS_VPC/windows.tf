resource "aws_instance" "Windows" {
    subnet_id = aws_subnet.public_subnet.id
    ami = var.windows-ami
    instance_type = var.instance_type_t3_micro
    get_password_data = true 
    ebs_block_device  {
        device_name = "/dev/sda1"
        volume_size = 30
        volume_type = "gp3"
    }
    vpc_security_group_ids = [aws_security_group.windows_sg.id]
    key_name = aws_key_pair.pavan_key.id
    
   

    tags={
        Name= random_pet.pavan_pet.id
    }
  
}
resource "aws_eip_association" "Windows_eip_assoc" {
    instance_id = aws_instance.Windows.id
    allocation_id = aws_eip.windows-eip.id
}
