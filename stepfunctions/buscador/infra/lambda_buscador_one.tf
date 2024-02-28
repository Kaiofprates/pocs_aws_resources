resource "aws_lambda_function" "buscadorone" {
  filename         = "hello_world_1.zip"
  function_name    = "buscadorone"
  handler          = "app.lambda_handler"
  runtime          = "python3.12"
  role             = aws_iam_role.lambda_role.arn
  timeout          = 21
  source_code_hash = data.archive_file.buscadorone_lambda_package.output_base64sha256
}