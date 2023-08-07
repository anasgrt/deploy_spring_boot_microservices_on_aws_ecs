resource "aws_kms_key" "ecs_kms_key" {
  description             = "ECS KMS Key"
  deletion_window_in_days = 7
}

resource "aws_cloudwatch_log_group" "ecs_cloudwatch_log" {
  name = "ECS_Cloudwatch_Log_Group"
  tags = {
    environment = "ecs_special"
    created_at  = timestamp()
  }

}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs_cluster_spring_boot"

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.ecs_kms_key.arn
      logging    = "OVERRIDE"

      log_configuration {
        /* cloud_watch_encryption_enabled = true */
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.ecs_cloudwatch_log.name
      }
    }
  }
  tags = {
    created_at  = timestamp()
  }
}