module "iam_user" {
  source =  "terraform-aws-modules/iam/aws//modules/iam-user"
  name = "maral.abaz"
  force_destroy = true
  pgp_key = "keybase:test"
  password_reset_required = false
}