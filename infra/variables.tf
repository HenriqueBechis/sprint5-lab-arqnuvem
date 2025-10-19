variable "aws_region" {
  description = "Região da AWS para os recursos"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Nome fixo do bucket S3. Deve ser único globalmente."
  # O que mudou: O valor padrão agora é o nome completo e fixo.
  default     = "lab-sprint5-arqnuvem-2307"
}

