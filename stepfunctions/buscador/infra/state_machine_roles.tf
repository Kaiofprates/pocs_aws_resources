

resource "aws_iam_role" "stepfunctions" {
  name = "stepfunctions-execution-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "states.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  inline_policy {
    name = "lambda-invoke-policy"

    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "lambda:InvokeFunction",
      "Resource": [
        "${aws_lambda_function.buscadortwo.arn}",
        "${aws_lambda_function.buscadorone.arn}"
      ]
    }
  ]
}
EOF
  }
}