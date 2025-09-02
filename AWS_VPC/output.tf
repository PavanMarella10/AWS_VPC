output "nat_public_id" {
  value = aws_eip.nat_eip.public_ip
}

output "random_pet" {
    value = random_pet.pavan_pet.id
  
}

output "random_id_base64_std" {
    value = random_id.pavan_id.b64_std
  
}

output "random_id_base64_url" {
    value = random_id.pavan_id.b64_url
  
}
output "random_id_byte_length" {
    value = random_id.pavan_id.byte_length
  
}

output "random_id_dec" {
    value = random_id.pavan_id.dec
  
}
output "random_id_hex" {
    value = random_id.pavan_id.hex
  
}
output "random_id" {
    value = random_id.pavan_id.id
  
}
output "random_id_keepers" {
    value = random_id.pavan_id.keepers
  
}
output "random_id_prefix" {
    value = random_id.pavan_id.prefix
  
}
output "linux_instance_id" {
    value = aws_instance.linux.id
}
output "linux_instance_private_ip" {
    value = aws_instance.linux.private_ip
}


output "windows_instance_id" {
    value = aws_instance.Windows.id
}
output "windows_instance_public_ip" {
    value = aws_instance.Windows.public_ip
}
output "windows_instance_private_ip" {
    value = aws_instance.Windows.private_ip
}
output "key_pair_name" {
    value = aws_key_pair.pavan_key
}
output "nat_private_ip" {
  value = aws_eip.nat_eip.private_ip
}
output "home_ip" {
    value= local.home_ip
}
output "pavan_web_server_encrypted_pwd" {
  value = aws_instance.Windows.password_data
  sensitive = false  
}
resource "local_file" "pavan_encrpt_pwd" {
  filename = "pavan_web_server_encrypted_password.txt"
  content = aws_instance.Windows.password_data
  
  provisioner "local-exec" {
    command = "echo ${local_file.pavan_encrpt_pwd.content}| base64 -d | openssl pkeyutl -decrypt -inkey ./${local_file.pavan_private_key_pem.filename} -out pavan_dycrypt_password.txt"
  }
}

output "reachable" {
    value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.path_found
  
}

output "status" { 
  value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.status
}

output "explanations" {
  value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.explanations
}









