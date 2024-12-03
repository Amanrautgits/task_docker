provider "aws" {
  region = "us-east-1"
}

resource "lambda_function" "lambda_from_ecr" {
  function_name = "lambda_from_ecr"
  package_type  = "Image"

  environment {
    variables = {
      S3_BUCKET   = "s3-bucket-temp-1"
      RDS_HOST    = "master.cluster-cosianxh.us-east-1.rds.amazonaws.com"
      RDS_DBNAME  = "master"
      RDS_USER    = "appuser"
      RDS_PASSWORD = "56f3hdjf86"
    }
  }

  role = aws_iam_role.lambda_role.arn
}

resource "aws_iam_role" "lambda_role_s3" {
  name               = "lambda-role_s3"
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
