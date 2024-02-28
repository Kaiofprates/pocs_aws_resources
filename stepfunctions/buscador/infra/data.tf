data "archive_file" "buscadortwo_lambda_package" {
  type        = "zip"
  source_dir  = "${path.module}/../buscadortwo/hello_world"
  output_path = "hello_world.zip"
}

data "archive_file" "buscadorone_lambda_package" {
  type        = "zip"
  source_dir  = "${path.module}/../buscadorone/hello_world"
  output_path = "hello_world_1.zip"
}