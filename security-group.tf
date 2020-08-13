data "aws_vpc" "iac_in_action" {
  // grab the default (AWS-created) VPC
  default = true
}

resource "aws_security_group" "iac_in_action" {
  // avoid setting the `name` attribute as the AWS API does not allow updating it

  // dynamically retrieve the ID of the VPC selected in the `aws_vpc` data source
  vpc_id = data.aws_vpc.iac_in_action.id

  tags = {
    Name        = "Terraform-managed Security Group for Hack the NE"
    Description = "Manage inbound / outbound traffic for EC2 Instance"
  }

  lifecycle {
    // ensure new security group is created and attached before
    // attempting to destroy the current, existing security group
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "iac_in_action_allow_all_from_self" {
  description = "Allow all inbound access from local IP address"
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"

  // use the output of icanhazip.com, then clean it up using the
  // chomp function; see https://hashi.co/tf-chomp for information
  cidr_blocks       = ["${chomp(data.http.icanhazip.body)}/32"]
  security_group_id = aws_security_group.iac_in_action.id
}

resource "aws_security_group_rule" "iac_in_action_allow_http_from_world" {
  description       = "Allow inbound HTTP access"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] // allow access from all IPs
  security_group_id = aws_security_group.iac_in_action.id
}

resource "aws_security_group_rule" "iac_in_action_allow_https_from_world" {
  description       = "Allow inbound HTTPs access"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] // allow access from all IPs
  security_group_id = aws_security_group.iac_in_action.id
}
