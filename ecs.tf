resource "aws_kms_key" "ecs_kms_key" {
  description             = "ECS KMS Key"
  deletion_window_in_days = 7
}

resource "aws_cloudwatch_log_group" "ecs_cloudwatch_log" {
  name = "ecs_springboot_log_group"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs_cluster_spring_boot"

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.ecs_kms_key.arn
      logging    = "OVERRIDE"

      log_configuration {
        /* cloud_watch_encryption_enabled = true */
        cloud_watch_log_group_name = aws_cloudwatch_log_group.ecs_cloudwatch_log.name
      }
    }
  }
}


data "template_file" "service" {
  template = file("${path.module}/task_definitions/service.json.tpl")
  vars = {
    ecr_url                = var.ecr_url
    spring_profiles_active = var.spring_profiles_active
  }
}

# ECS Task Definition
resource "aws_ecs_task_definition" "service" {
  family                   = "service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = aws_iam_role.ecs_service_role.arn
  task_role_arn            = aws_iam_role.ecs_service_role.arn
  container_definitions = jsonencode([

    {
      name      = "spring1"
      image     = var.ecr_url
      cpu       = 1024
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = 8081
          hostPort      = 8081
        }
      ]
    }
  ])
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}