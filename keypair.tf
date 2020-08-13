// create Private Key Material for use as SSH Key
resource "tls_private_key" "iac_in_action" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

// register Public Key part of SSH Key with EC2 Console
resource "aws_key_pair" "iac_in_action" {
  key_name   = "Terraform-managed EC2 Key Pair for IaC in Action"
  public_key = tls_private_key.iac_in_action.public_key_openssh

  tags = {
    Name = "Terraform-managed EC2 Key Pair for IaC in Actoin"
  }
}

// render Private Key part of SSH Key as a local file
resource "local_file" "private_ssh_key" {
  content  = tls_private_key.iac_in_action.private_key_pem
  filename = "${path.module}/${var.ssh_key_file}"

  // set correct permissions on Private Key file
  file_permission = "0400"
}
