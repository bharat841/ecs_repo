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