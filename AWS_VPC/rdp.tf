data "template_file" "Pavan_rdp" {
  template = <<-RDP_CONTENT
    auto connect:i:1
    full address:s:${aws_eip.windows-eip.public_ip}
    username:s:Administrator
    audiomode:i:2
    audiocapturemode:i:1
  RDP_CONTENT

}

resource "local_file" "pavan_rdp_file" {
  content  = data.template_file.Pavan_rdp.rendered
  #filename = "${var.rdp_file_name}.rdp"
  filename = "pavan_web_${formatdate("YYYYMMDDhhmmss", timestamp())}.rdp"

  depends_on = [aws_eip_association.Windows_eip_assoc]

}

resource "null_resource" "rdp_execute" {

  triggers = {
    rdp_file = local_file.pavan_rdp_file.filename

  }
  
  provisioner "local-exec" {
    command = "mstsc /f ${local_file.pavan_rdp_file.filename}"
    working_dir = "${path.module}"
   
  }

}