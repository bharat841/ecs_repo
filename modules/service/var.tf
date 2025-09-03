variable "service_name" {
  type        = string
  description = "ECS service name"
}

variable "task_definition_arn" {
  type        = string
  description = "Task Definition ARN to use for ECS service"
}

variable "cluster_id" {
  type        = string
  description = "ECS cluster ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for ECS service"
}

variable "sg_ids" {
  type        = list(string)
  description = "Security Group IDs for ECS service"
}

variable "desired_count" {
  type        = number
  description = "Desired number of tasks"
}

variable "assign_public_ip" {
  type        = bool
  description = "Whether to assign public IP"
}

variable "tags" {
  type        = map(string)
  description = "Tags for ECS service"
}
