# Cluster
variable "ecs_cluster_name" { type = string }
variable "tags"             { type = map(string) }

# Subnets
variable "public_subnet_ids"  { type = list(string) }
variable "private_subnet_ids" { type = list(string) }

# Security Groups (from previous modules)
variable "frontend_sg_id" { type = string }
variable "backend_sg_id"  { type = string }
variable "redis_sg_id"    { type = string }
variable "postgres_sg_id" { type = string }
variable "nginx_sg_id"    { type = string }

# Task definitions (from previous modules)
variable "frontend_task_definition_arn" { type = string }
variable "backend_task_definition_arn"  { type = string }
variable "redis_task_definition_arn"    { type = string }
variable "postgres_task_definition_arn" { type = string }
variable "nginx_task_definition_arn"    { type = string }
