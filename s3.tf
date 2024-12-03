provider "aws" {
  region = "us-east-1"
}

# Create S3 Bucket
resource "aws_s3_bucket" "s3-bucket-temp-1" {
  bucket = "s3-bucket-temp-1"
}

resource "aws_db_instance" "rds" {
  allocated_storage = 20
  db_name           = "master"
  engine            = "mysql"
  instance_class    = "db.t2.micro"
  username          = "appuser"
  password          = "56f3hdjf86"
  db_subnet_group_name = "test"
}

resource "aws_iam_role" "lambda_role" {
  name               = "lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect    = "Allow"
      },
    ]
  })
}


resource "aws_lambda_function" "lambda_from_ecr" {
  function_name = "my_lambda_function"
  package_type  = "Image"
}
