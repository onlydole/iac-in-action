// see https://www.terraform.io/docs/providers/tls/index.html
provider "tls" {
  version = "~> 2.1"
}

// see https://www.terraform.io/docs/providers/local/index.html
provider "local" {
  version = "~> 1.4.0"
}

// see https://www.terraform.io/docs/providers/http/index.html
provider "http" {
  version = "1.2.0"
}

// see https://www.terraform.io/docs/providers/aws/index.html
provider "aws" {
  version = "~> 2.70"
  region  = "us-east-1"
}
