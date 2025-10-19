provider "aws" {
  # CORREÇÃO: Adicionado o sinal de =
  region = var.aws_region
}

# Adiciona um sufixo aleatório para garantir que o nome do bucket seja único
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_s3_bucket" "lab" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.lab.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1) [cite: 155]
  instance_type = "t2.micro" [cite: 156]
  tags = {
    Name = "Sprint5-EC2" [cite: 158]
  }
}

output "bucket_name" {
  # CORREÇÃO: Adicionado o sinal de =
  value = aws_s3_bucket.lab.bucket
}

output "ec2_public_ip" {
  # CORREÇÃO: Adicionado o sinal de =
  value = aws_instance.app_server.public_ip
}
