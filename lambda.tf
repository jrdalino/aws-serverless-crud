# Lambda IAM Role and Policy
resource "aws_iam_role" "lambda_service_role" {
  name = "${var.lambda_service_role_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_service_role_policy" {
  name = "${var.lambda_service_role_policy_name}"
  description = "Provides write permissions to CloudWatch Logs."
  path = "/"  

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",      
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Effect": "Allow",      
      "Action": [
        "dynamodb:Query",
        "dynamodb:Scan",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:UpdateItem",
        "dynamodb:DeleteItem"
      ],
      "Resource": "arn:aws:dynamodb:${var.aws_region}:${var.aws_account}:table/${var.aws_dynamodb_table_name}"
    },
    {
      "Effect": "Allow",      
      "Action": [
        "xray:PutTraceSegments",
        "xray:PutTelemetryRecords",
        "xray:GetSamplingRules",
        "xray:GetSamplingTargets",
        "xray:GetSamplingStatisticSummaries"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role = "${aws_iam_role.lambda_service_role.name}"
  policy_arn = "${aws_iam_policy.lambda_service_role_policy.arn}"
}

# Lambda API Gateway Permissions
resource "aws_lambda_permission" "apigw_post" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create.function_name
  principal     = "apigateway.amazonaws.com"

  # The "/*/*" portion grants access from any method on any resource
  # within the API Gateway REST API.
  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

resource "aws_lambda_permission" "apigw_get_all" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.list.function_name
  principal     = "apigateway.amazonaws.com"

  # The "/*/*" portion grants access from any method on any resource
  # within the API Gateway REST API.
  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

resource "aws_lambda_permission" "apigw_get_by_id" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get.function_name
  principal     = "apigateway.amazonaws.com"

  # The "/*/*" portion grants access from any method on any resource
  # within the API Gateway REST API.
  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

# TODO: Add Lambda API Gateway Permissions for Put and Delete

# Archive
data "archive_file" "create" {
  type        = "zip"
  source_dir  = "src/create"
  output_path = "build/create.zip"
}

data "archive_file" "delete" {
  type        = "zip"
  source_dir  = "src/delete"
  output_path = "build/delete.zip"
}

data "archive_file" "get" {
  type        = "zip"
  source_dir  = "src/get"
  output_path = "build/get.zip"
}

data "archive_file" "list" {
  type        = "zip"
  source_dir  = "src/list"
  output_path = "build/list.zip"
}

data "archive_file" "update" {
  type        = "zip"
  source_dir  = "src/update"
  output_path = "build/update.zip"
}

# Lambda Function
resource "aws_lambda_function" "create" {
  function_name    = "${var.aws_lambda_function_name_create}"

  filename         = "${data.archive_file.create.output_path}"
  source_code_hash = "${data.archive_file.create.output_base64sha256}" 

  role             = "${aws_iam_role.lambda_service_role.arn}"
  handler          = "create.lambda_handler"
  runtime          = "python3.8"
  timeout          = "3"

  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "delete" {
  function_name    = "${var.aws_lambda_function_name_delete}"

  filename         = "${data.archive_file.delete.output_path}"
  source_code_hash = "${data.archive_file.delete.output_base64sha256}" 

  role             = "${aws_iam_role.lambda_service_role.arn}"
  handler          = "delete.lambda_handler"
  runtime          = "python3.8"
  timeout          = "3"

  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "get" {
  function_name    = "${var.aws_lambda_function_name_get}"

  filename         = "${data.archive_file.get.output_path}"
  source_code_hash = "${data.archive_file.get.output_base64sha256}" 

  role             = "${aws_iam_role.lambda_service_role.arn}"
  handler          = "get.lambda_handler"
  runtime          = "python3.8"
  timeout          = "3"

  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "list" {
  function_name    = "${var.aws_lambda_function_name_list}"

  filename         = "${data.archive_file.list.output_path}"
  source_code_hash = "${data.archive_file.list.output_base64sha256}" 

  role             = "${aws_iam_role.lambda_service_role.arn}"
  handler          = "list.lambda_handler"
  runtime          = "python3.8"
  timeout          = "3"

  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "update" {
  function_name    = "${var.aws_lambda_function_name_update}"

  filename         = "${data.archive_file.update.output_path}"
  source_code_hash = "${data.archive_file.update.output_base64sha256}" 

  role             = "${aws_iam_role.lambda_service_role.arn}"
  handler          = "update.lambda_handler"
  runtime          = "python3.8"
  timeout          = "3"

  tracing_config {
    mode = "Active"
  }
}

# CloudWatch Logs
resource "aws_cloudwatch_log_group" "create" {
  name              = "/aws/lambda/${var.aws_lambda_function_name_create}"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "delete" {
  name              = "/aws/lambda/${var.aws_lambda_function_name_delete}"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "get" {
  name              = "/aws/lambda/${var.aws_lambda_function_name_get}"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "list" {
  name              = "/aws/lambda/${var.aws_lambda_function_name_list}"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "update" {
  name              = "/aws/lambda/${var.aws_lambda_function_name_update}"
  retention_in_days = 14
}