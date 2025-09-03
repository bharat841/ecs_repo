output "frontend_service_id" {
  value = module.frontend_service.service_id
}

output "backend_service_id" {
  value = module.backend_service.service_id
}

output "redis_service_id" {
  value = module.redis_service.service_id
}

output "postgres_service_id" {
  value = module.postgres_service.service_id
}

output "nginx_service_id" {
  value = module.nginx_service.service_id
}
