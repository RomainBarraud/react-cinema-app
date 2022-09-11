# S3 resources

resource "aws_s3_bucket" "cinema_app_s3_bucket" {
  bucket        = "${local.prefix}-app"
  acl           = "public-read"
  force_destroy = true

  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "PublicReadGetObject",
        "Action": [
          "s3:GetObject"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::${local.prefix}-app/*",
        "Principal": "*"
      }
    ]
  }
  EOF

  website {
      index_document = "index.html"
      error_document = "index.html"
  }

  versionning {
      enabled = true
  }

  tags = local.command_tags
}

# resource "aws_s3_bucket" "cinema_app_s3_bucket_policy" {
#   bucket = s3-website-test.cinema_app_s3_bucket.id

#   policy = <<POLICY
#   {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Sid": "PublicReadForGetBucketObjects",
#             "Effect": "Allow",
#             "Principal": "*",
#             "Action": "s3:GetObject",
#             "Resource": "arn:aws:s3:::${local.prefix}-app/*"
#         }
#     ]
#   }
#   POLICY
# }