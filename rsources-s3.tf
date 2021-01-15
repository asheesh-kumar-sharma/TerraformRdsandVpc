# module "s3_bucket" {
#   source = "terraform-aws-modules/s3-bucket/aws"

#   bucket = "virtega-bucket-${terraform.workspace}"
#   acl    = "private"

#   versioning = {
#     enabled = true
#   }
# }