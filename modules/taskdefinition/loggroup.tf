resource "aws_cloudwatch_log_group" "ecs" {
  for_each = var.task_definitions
  name     = each.value.log_group
  retention_in_days = 7
}
