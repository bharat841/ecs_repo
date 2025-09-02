## ecr-repository
variable "ecr_repo_name"{
    type = string
    description = "ecr repo name"
}
variable "ecr_image_tag"{
    type = string
    description = "image tag mutable or non mutable"
}
variable "ecr_env"{
    type = string
    description = "enironmen tfor ecr"
}
variable "ecr_project"{
    type = string
    description = "project name"
}

##task-definition

variable "aws_region"{
    description = "region "
}
variable "frontend_family_name"{
    description = "forntend family name"
}
variable "image_url"{
    description = "forntend image url"
}
variable "backend_name"{
    description = "backend task definition name"
}
variable "backend_image_url"{
    description = "back image url"
}
variable "redis_name"{
    description = "redis name"
}
variable "redis_image_url"{
    description = "image url redis"
}
variable "postgres_name"{
    description = "postgres name"
}
variable "postgres_image_url" {
    description = "postgres iamge url"
}
variable "nginx_name" {
    description = "nginx-name"
}
variable "nginx_image_url" {
    description = "image url"
}
variable "role_name"{
    description = "default"
}
variable "role_arn"{
    description = "arn of iam"
}