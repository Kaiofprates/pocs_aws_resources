resource "aws_sfn_state_machine" "example" {
  name     = "example-state-machine"
  role_arn = aws_iam_role.stepfunctions.arn

  definition = <<EOF
{
  "Comment": "A state machine that runs two Lambda functions in parallel",
  "StartAt": "ParallelExecution",
  "States": {
    "ParallelExecution": {
      "Type": "Parallel",
      "Branches": [
        {
          "StartAt": "LambdaFunction1",
          "States": {
            "LambdaFunction1": {
              "Type": "Task",
              "Resource": "${aws_lambda_function.buscadorone.arn}",
              "End": true
            }
          }
        },
        {
          "StartAt": "LambdaFunction2",
          "States": {
            "LambdaFunction2": {
              "Type": "Task",
              "Resource": "${aws_lambda_function.buscadortwo.arn}",
              "End": true
            }
          }
        }
      ],
      "End": true
    }
  }
}
EOF
}
