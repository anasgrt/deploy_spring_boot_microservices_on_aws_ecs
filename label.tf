module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.21.0"
  delimiter  = var.delimiter
  attributes = var.attributes
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  tags       = var.tags
}