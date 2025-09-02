resource "random_pet" "pavan_pet" {
    length = 3
  
}
resource "random_password" "pavan_password" {
    length = 15
    special = true
  
}

resource "random_id" "pavan_id" {
    byte_length = 8
  
}

resource "random_integer" "pavan_integer" {
    min = 10
    max= 100
  
}

resource "random_string" "pavan_string" {
    length = 16
    upper = true
    special = true
  
}
resource "random_uuid" "pavan_uuid" {

}

resource "random_shuffle" "Random_region" {
  input        = ["us-east-1", "us-east-2"]
  result_count = 1
}