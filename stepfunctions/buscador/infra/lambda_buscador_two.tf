resource "aws_lambda_function" "buscadortwo" {
  filename         = "hello_world.zip"
  function_name    = "buscadortwo"
  handler          = "app.lambda_handler"
  runtime          = "python3.12"
  role             = aws_iam_role.lambda_role.arn
  timeout          = 15
  source_code_hash = data.archive_file.buscadortwo_lambda_package.output_base64sha256
}
