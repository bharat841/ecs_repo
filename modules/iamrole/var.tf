variable "role_name"{
}
variable "role_arn" {
  description = "IAM role ARN for ECS task execution"
  type        = string
}
variable "aws_region" {
  description = "AWS region"
  type        = string
}
