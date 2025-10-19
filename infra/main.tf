provider "aws" {
  region = var.awsregion
}

resource "aws_s3_bucket" "lab" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.lab.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_instance" "appserver" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  tags = {
    Name = "Sprint5-EC2"
  }
}

output "bucketname" {
  value = aws_s3_bucket.lab.bucket
}

output "ec2publicip" {
  value = aws_instance.appserver.public_ip
}
