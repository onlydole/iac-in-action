// output a ready-to-copy-and-paste version of a SSH connection string
output "ssh_connection_string" {
  value = "ssh -i \"${var.ssh_key_file}\" ec2-user@${aws_instance.iac_in_action.public_ip}"
}

output "website_url" {
  value = aws_s3_bucket.iac_in_action.website_endpoint
}
