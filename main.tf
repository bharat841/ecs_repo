module "ecr"{
    source = "./modules/ecr"
    ecr_repo_name = var.ecr_repo_name
    ecr_image_tag = var.ecr_image_tag
    ecr_env = var.ecr_env
    ecr_project = var.ecr_project
}
module "iam" {
  source    = "./modules/iamrole"
  aws_region = var.aws_region
  role_name = var.role_name

  
}
module "taskdefinition" {
  source          = "./modules/taskdefinition"
  aws_region      = var.aws_region
  role_name       = var.role_name
  task_definitions = var.task_definitions
  execution_role_arn = module.iam.ecs_task_execution_role_arn
  task_role_arn      = module.iam.ecs_task_role_arn
}
module "networking" {
  source               = "./modules/networking"
  aws_region           = var.aws_region
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = var.tags
}
# ------------------------------
# Frontend SG
# ------------------------------
module "frontend_sg" {
  source        = "./modules/sg-groups"
  sg_name       = var.frontend_sg.sg_name
  sg_description = var.frontend_sg.sg_description
  vpc_id        = var.vpc_id
  ingress_rules = var.frontend_sg.ingress_rules
  egress_rules  = var.frontend_sg.egress_rules
  tags          = var.sg_tags
}

# ------------------------------
# Backend SG
# ------------------------------
module "backend_sg" {
  source        = "./modules/sg-groups"
  sg_name       = var.backend_sg.sg_name
  sg_description = var.backend_sg.sg_description
  vpc_id        = var.vpc_id
  ingress_rules = [
    {
      from_port       = 8080
      to_port         = 8080
      protocol        = "tcp"
      cidr_blocks     = []
      security_groups = [module.frontend_sg.sg_id]   # Frontend can access backend
    },
    {
      from_port       = 6379
      to_port         = 6379
      protocol        = "tcp"
      cidr_blocks     = []
      security_groups = []  # Redis will reference backend later if needed
    }
  ]
  egress_rules  = var.backend_sg.egress_rules
  tags          = var.sg_tags
}

# ------------------------------
# Postgres SG
# ------------------------------
module "postgres_sg" {
  source        = "./modules/sg-groups"
  sg_name       = var.postgres_sg.sg_name
  sg_description = var.postgres_sg.sg_description
  vpc_id        = var.vpc_id
  ingress_rules = [
    {
      from_port       = 5432
      to_port         = 5432
      protocol        = "tcp"
      cidr_blocks     = []
      security_groups = [module.backend_sg.sg_id]   # Backend can access Postgres
    }
  ]
  egress_rules  = var.postgres_sg.egress_rules
  tags          = var.sg_tags
}

# ------------------------------
# Redis SG
# ------------------------------
module "redis_sg" {
  source        = "./modules/sg-groups"
  sg_name       = var.redis_sg.sg_name
  sg_description = var.redis_sg.sg_description
  vpc_id        = var.vpc_id
  ingress_rules = [
    {
      from_port       = 6379
      to_port         = 6379
      protocol        = "tcp"
      cidr_blocks     = []
      security_groups = [module.backend_sg.sg_id]   # Backend can access Redis
    }
  ]
  egress_rules  = var.redis_sg.egress_rules
  tags          = var.sg_tags
}

# ------------------------------
# Nginx SG
# ------------------------------
module "nginx_sg" {
  source        = "./modules/sg-groups"
  sg_name       = var.nginx_sg.sg_name
  sg_description = var.nginx_sg.sg_description
  vpc_id        = var.vpc_id
  ingress_rules = var.nginx_sg.ingress_rules
  egress_rules  = var.nginx_sg.egress_rules
  tags          = var.sg_tags
}
