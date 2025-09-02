resource "aws_cloudwatch_log_group" "frontend" {
  name              = "/ecs/frontend2"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "backend" {
  name              = "/ecs/backend2"
  retention_in_days = 7
}
resource "aws_cloudwatch_log_group" "redis" {
  name              = "/ecs/redis2"
  retention_in_days = 7
}
resource "aws_cloudwatch_log_group" "postgres" {
  name              = "/ecs/postgres2"
  retention_in_days = 7
}
resource "aws_cloudwatch_log_group" "nginx" {
  name              = "/ecs/nginx2"
  retention_in_days = 7
}