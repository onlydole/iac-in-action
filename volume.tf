// create EBS Volume
resource "aws_ebs_volume" "iac_in_action" {
  availability_zone = var.availability_zone
  size              = 100
  type              = "io1"
  iops              = 1000

  tags = {
    Name = "Terraform-managed EBS Volume for Hack the NE"
  }
}

// attach EBS Volume to EC2 Instance
resource "aws_volume_attachment" "iac_in_action" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.iac_in_action.id
  instance_id = aws_instance.iac_in_action.id
}
