provider "aws" {
  [cite_start]region = var.aws_region [cite: 138, 139, 141]
}

# Adiciona um sufixo aleatório para garantir que o nome do bucket seja único
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_s3_bucket" "lab" {
  # O nome do bucket agora usará a variável que contém o prefixo + o sufixo aleatório
  [cite_start]bucket = var.bucket_name [cite: 142, 143]
}

resource "aws_s3_bucket_versioning" "versioning" {
  [cite_start]bucket = aws_s3_bucket.lab.id [cite: 147]
  versioning_configuration {
    [cite_start]status = "Enabled" [cite: 149]
  }
}

resource "aws_instance" "app_server" {
  [cite_start]ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1) [cite: 153, 155]
  [cite_start]instance_type = "t2.micro" [cite: 156]
  tags = {
    [cite_start]Name = "Sprint5-EC2" [cite: 157, 158, 159]
  }
}

output "bucket_name" {
  [cite_start]value = aws_s3_bucket.lab.bucket [cite: 161, 162]
}

output "ec2_public_ip" {
  [cite_start]value = aws_instance.app_server.public_ip [cite: 164, 165]
}
