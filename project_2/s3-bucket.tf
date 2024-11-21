resource "aws_s3_bucket" "s3_outbound" {
    # count = var.owner_email ? 4 : 0
    for_each = var.environment
    bucket = "${each.value}-${var.region}-${var.outbound}"
    force_destroy = var.force_destroy
}
resource "aws_s3_bucket" "s3_inbound" {
    # count = var.owner_email ? 4 : 0
    for_each = var.environment
    bucket = "${each.value}-${var.region}-${var.inbound}"
    force_destroy = var.force_destroy
}