resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = var.ecr_image_tag

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = var.ecr_env
    Project     = var.ecr_project
  }
}