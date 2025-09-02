module "ecr"{
    source = "./modules/ecr"
    ecr_repo_name = var.ecr_repo_name
    ecr_image_tag = var.ecr_image_tag
    ecr_env = var.ecr_env
    ecr_project = var.ecr_project
}