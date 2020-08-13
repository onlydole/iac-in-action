resource "aws_s3_bucket" "iac_in_action" {
  bucket_prefix = var.website_bucket_name
  acl    = "public-read"

  website {
    index_document = var.website_index_document
    error_document = var.website_error_document
  }

  cors_rule {
    allowed_headers = var.website_cors_allowed_headers
    allowed_methods = var.website_cors_allowed_methods
    allowed_origins = var.website_cors_allowed_origin
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}
