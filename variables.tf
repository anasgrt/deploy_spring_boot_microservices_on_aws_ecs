variable "ecr_url" {
    type = string
    default = "099211283664.dkr.ecr.eu-west-1.amazonaws.com/users-microservice:latest"
}

variable "delimiter" {
  type        = string
  default     = "_"
  description = "Delimiter to be used between `name`, `namespace`, `stage` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "name" {
  type        = string
  default     = ""
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = "dev"
}

variable "region" {
  default = "eu-west-1"
}

/* variable "fargate_cpu" {
  default = "512"
}

variable "fargate_memory" {
  default = "1024"
} */

variable "spring_profiles_active" {
  default = "dev"
}