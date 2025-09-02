resource "aws_ec2_network_insights_path" "home_to_ec2" {
    source = aws_internet_gateway.igw.id
    destination = aws_instance.Windows.id
    destination_port = 80
    protocol = "tcp"
    source_ip = local.home_ip
    tags ={
        name="home_to ec2${random_pet.pavan_pet.id}"
    }
  
}

resource "aws_ec2_network_insights_analysis" "home_to_ec2_analysis" {
    network_insights_path_id = aws_ec2_network_insights_path.home_to_ec2.id
    wait_for_completion = true
    depends_on = [ aws_internet_gateway.igw,aws_instance.Windows ]
  
}