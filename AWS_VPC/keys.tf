resource "tls_private_key" "pavan_private_key" {
    algorithm = "RSA"
    rsa_bits = 2048
}


resource "aws_key_pair" "pavan_key" {
    key_name = "windows-${random_pet.pavan_pet.id}_windows"
    public_key = tls_private_key.pavan_private_key.public_key_openssh
}

resource "local_file" "pavan_private_key_pem" {
    filename = "${random_pet.pavan_pet.id}_private.pem"
    content = tls_private_key.pavan_private_key.private_key_pem
  
}

resource "local_file" "pavan_public_key_pem" {
    filename = "${random_pet.pavan_pet.id}_public.pem"
    content = tls_private_key.pavan_private_key.public_key_openssh
}