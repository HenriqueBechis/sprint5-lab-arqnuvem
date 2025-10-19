variable "aws_region" {
  description = "Região da AWS para os recursos"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Nome do bucket S3. Deve ser único globalmente."
  default     = "lab-sprint5-arqnuvem-${random_string.suffix.result}"
}
