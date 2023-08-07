# AWS Elastic Container Repository:
resource "aws_ecr_repository" "springboot_repo" {
    name = "users-microservice"

    image_scanning_configuration {
      scan_on_push = true
    }
}