variable "aws_region" {
  description = "AWS region"
  type        = string
}
variable "execution_role_arn" {
  type        = string
  description = "IAM execution role ARN for ECS task definition"
}

variable "task_role_arn" {
  type        = string
  description = "IAM task role ARN for ECS task definition"
}
variable "task_definitions" {
  description = "Map of ECS task definitions for different services"
  type = map(object({
    family_name = string
    image_url   = string
    port        = number
    cpu         = number
    memory      = number
    log_group = string 
    environment = list(object({
      name  = string
      value = string
    }))
  }))
}
variable "role_name"{
  
}