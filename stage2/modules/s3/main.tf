data "aws_s3_bucket" "static_site" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "static_site" {
  bucket = data.aws_s3_bucket.static_site.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  lifecycle {
    # prevent_destroy = true
    ignore_changes  = [bucket]
  }

  # count = length(data.aws_s3_bucket.existing_bucket.id) == 0 ? 1 : 0
}

resource "aws_s3_bucket_policy" "static_site_policy" {
  bucket = data.aws_s3_bucket.static_site.id


  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${data.aws_s3_bucket.static_site.arn}/*"
      }
    ]
  })

  lifecycle {
    # prevent_destroy = true
    ignore_changes = [bucket]
  }
}

