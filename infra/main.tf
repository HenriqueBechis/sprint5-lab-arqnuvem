provider "aws" {
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
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  # [cite_start]CORREÇÃO: Removida a citação [cite: 156] da linha abaixo
  instance_type = "t2.micro"
  tags = {
    Name = "Sprint5-EC2"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.lab.bucket
}

output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}
