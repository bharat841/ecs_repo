module "ecr"{
    source = "./modules/ecr"
    ecr_repo_name = var.ecr_repo_name
    ecr_image_tag = var.ecr_image_tag
    ecr_env = var.ecr_env
    ecr_project = var.ecr_project
}
module "taskdefinition"{
    source = "./modules/taskdefinition"
    forntend = true
    frontend_family_name = var.frontend_family_name
    image_url = var.image_url
    aws_region = var.aws_region
    role_name = var.role_name 
    role_arn = var.role_arn
}
module "taskdefinition2" {
   source = "./modules/taskdefinition"
   backend_name= var.backend_name
   backend_image_url = var.backend_image_url
   aws_region = var.aws_region
   role_name = var.role_name 
   role_arn = var.role_arn
}

module "taskdefinition3" {
   source = "./modules/taskdefinition"
   redis_name = var.redis_name
   redis_image_url = var.redis_image_url
   aws_region = var.aws_region
   role_name = var.role_name 
   role_arn = var.role_arn
}

module "taskdefinition4" {
   source = "./modules/taskdefinition"
   postgres_name  = var.postgres_name
   postgres_image_url  = var.postgres_image_url
   aws_region = var.aws_region
   role_name = var.role_name 
   role_arn = var.role_arn
}

module "taskdefinition5" {
   source = "./modules/taskdefinition"
   nginx_name= var.nginx_name
   nginx_image_url  = var.nginx_image_url
   aws_region = var.aws_region
   role_name = var.role_name 
   role_arn = var.role_arn
}