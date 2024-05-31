resource "aws_iam_role" "lambda_execution_role" {
  name = "${var.lambda_function_name}_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_policy" "lambda_s3_access" {
  name = "${var.lambda_function_name}_s3_access"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:GetObject", "s3:PutObject"],
        Resource = "arn:aws:s3:::${var.s3_bucket_name}/*",
        Effect   = "Allow"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_s3_access_attachment" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_s3_access.arn
}

data "archive_file" "zip_the_python" {
  type        = "zip"
  source_dir  = "../../../modules/python/"
  output_path = "../../../modules/rolecall.zip"
}

resource "aws_lambda_function" "lambda" {
  filename     = data.archive_file.zip_the_python.output_path

  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  role          = aws_iam_role.lambda_execution_role.arn
  runtime       = var.runtime

  depends_on = [aws_iam_role_policy_attachment.lambda_s3_access_attachment]

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}_${var.aws_region}_${var.env}_lambda"
    }
  )
}

