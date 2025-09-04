##ecr repo

ecr_repo_name = "new-repo"
aws_region = "ap-south-1"
ecr_image_tag  = " MUTABLE "            # or use a specific tag like "v1.0.0"
ecr_env        = "dev"               # or "prod", "staging", etc.
ecr_project    = "my-ecr-project"

## task definition


# role_name  = "ecsTaskExecutionRole"  # or whatever you named it

# task_definitions = {
#   frontend = {
#     family_name = "frontend"
#     image_url   = "123456789012.dkr.ecr.us-east-1.amazonaws.com/frontend:latest"
#     cpu         = "256"
#     memory      = "512"
#     port        = 5000
#     environment = [
#       {
#         name  = "REACT_APP_BACKEND_URL"
#         value = "http://backend:8080"
#       }
#     ]
#   }

#   backend = {
#     family_name = "backend"
#     image_url   = "123456789012.dkr.ecr.us-east-1.amazonaws.com/backend:latest"
#     cpu         = "512"
#     memory      = "1024"
#     port        = 8080
#     environment = [
#       { name = "REDIS_HOST",         value = "redis" },
#       { name = "POSTGRES_HOST",      value = "postgres" },
#       { name = "POSTGRES_USER",      value = "postgres" },
#       { name = "POSTGRES_PASSWORD",  value = "postgres" },
#       { name = "POSTGRES_DATABASE",  value = "postgres" },
#       { name = "REQUEST_ORIGIN",     value = "http://frontend:5000" }
#     ]
#   }

#   redis = {
#     family_name = "redis"
#     image_url   = "redis:latest"
#     cpu         = "256"
#     memory      = "256"
#     port        = 6379
#     environment = []
#   }

#   postgres = {
#     family_name = "postgres"
#     image_url   = "postgres:13.2-alpine"
#     cpu         = "512"
#     memory      = "1024"
#     port        = 5432
#     environment = [
#       { name = "POSTGRES_PASSWORD", value = "postgres" }
#     ]
#   }

#   reverse_proxy = {
#     family_name = "reverse-proxy"
#     image_url   = "nginx:1.19-alpine"
#     cpu         = "256"
#     memory      = "512"
#     port        = 80
#     environment = [
#       { name = "NGINX_PORT", value = "80" }
#     ]
#   }
# }

