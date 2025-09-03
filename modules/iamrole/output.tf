output "ecs_task_execution_role_arn" {
  value = aws_iam_role.ecsTaskExecutionRole.arn
}

output "ecs_task_role_arn" {
  value = aws_iam_role.ecsTaskRole.arn
}