resource "aws_eip" "nat_eip" {
    domain = "vpc"
    tags={
        Name = "${random_pet.pavan_pet.id}-NAT"
    }
  
}
resource "aws_eip" "windows-eip" {
    domain = "vpc"
    tags={
        Name="${random_pet.pavan_pet.id}-Windows-EIP"
    }
  
}