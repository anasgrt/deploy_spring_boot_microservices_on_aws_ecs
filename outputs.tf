output "ecr_url" {
  description = "The ECR Repo URL"
  value       = aws_ecr_repository.service.repository_url
}
output "cluster_arn" {
  description = "The Cluster ARN"
  value       = aws_ecs_cluster.ecs_cluster.arn
}

output "rendered_template" {
  value = data.template_file.service.rendered
}

output "ecs_task_definition" {
  description = "ECS Task Definition ARN"
  value = aws_ecs_task_definition.service.arn
}