/* output "ecr_url" {
  description = "The ECR Repo URL"
  value       = aws_ecr_repository.springboot_repo.repository_url
} */
output "cluster_arn" {
  description = "The Cluster ARN"
  value       = aws_ecs_cluster.ecs_cluster.arn
}
