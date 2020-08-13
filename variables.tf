# Amazon Linux 2 AMI (HVM), SSD Volume Type
variable "ami_id" {
  type        = string
  description = "AMI ID to use"
  default     = "ami-09d95fab7fff3776c"
}

variable "instance_type" {
  type        = string
  description = "Instance type to use"
  default     = "t3.micro"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone to use"
  default     = "us-east-1a"
}

variable "ssh_key_file" {
  type        = string
  description = "SSH Key file name"
  default     = "ec2-ssh-key.pem"
}

// get your public IP address by querying ICHI
data "http" "icanhazip" {
  // this value will be available in data.http.icanhazip.body
  url = "https://icanhazip.com/"
}

variable "website_bucket_name" {
  type        = string
  description = "S3 Bucket Name for Website"
  default = "iac-in-action"
}

variable "website_index_document" {
  type        = string
  description = "Index Document for Website"
  default     = "index.html"
}

variable "website_error_document" {
  type        = string
  description = "Error (Not Found) Document for Website"
  default     = "404.html"
}

variable "website_cors_allowed_headers" {
  type        = list
  description = "Allowed Headers for Website CORS"
  default     = ["*"]
}

variable "website_cors_allowed_methods" {
  type        = list
  description = "Allowed Methods for Website CORS"
  default     = ["GET", "POST", "PUT"]
}

variable "website_cors_allowed_origin" {
  type        = list
  description = "Allowed Origins for Website CORS"
  default     = ["https://iac-in-action.com"]
}
