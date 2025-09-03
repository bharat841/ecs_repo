resource "aws_ecs_task_definition" "ecs_tasks" {
  for_each               = var.task_definitions
  family                 = each.value.family_name
  requires_compatibilities = ["FARGATE"]
  network_mode           = "awsvpc"
  cpu                    = each.value.cpu
  memory                 = each.value.memory
 
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = each.value.family_name
      image     = each.value.image_url
      essential = true
      cpu       = each.value.cpu
      memory    = each.value.memory
      portMappings = [
        {
          containerPort = each.value.port
          hostPort      = each.value.port
          protocol      = "tcp"
        }
      ]
      environment = each.value.environment
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.ecs[each.key].name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}
