# Lambda IAM Role
output "lambda_service_role_arn" {
  value = "${aws_iam_role.lambda_service_role.arn}"
}

# Lambda: Create
output "aws_lambda_function_create_arn" {
  value = "${aws_lambda_function.create.arn}"
}

output "aws_lambda_function_create_invoke_arn" {
  value = "${aws_lambda_function.create.invoke_arn}"
}


# Lambda: Read
output "aws_lambda_function_read_arn" {
  value = "${aws_lambda_function.read.arn}"
}

output "aws_lambda_function_read_invoke_arn" {
  value = "${aws_lambda_function.read.invoke_arn}"
}

# Lambda: Update
output "aws_lambda_function_update_arn" {
  value = "${aws_lambda_function.update.arn}"
}

output "aws_lambda_function_update_invoke_arn" {
  value = "${aws_lambda_function.update.invoke_arn}"
}


# Lambda: Delete
output "aws_lambda_function_delete_arn" {
  value = "${aws_lambda_function.delete.arn}"
}

output "aws_lambda_function_delete_invoke_arn" {
  value = "${aws_lambda_function.delete.invoke_arn}"
}

# Lambda: Index
output "aws_lambda_function_index_arn" {
  value = "${aws_lambda_function.index.arn}"
}

output "aws_lambda_function_index_invoke_arn" {
  value = "${aws_lambda_function.index.invoke_arn}"
}


# DynamoDB Table
output "aws_dynamodb_table_arn" {
  value       = "${aws_dynamodb_table.this.arn}"
  description = "The arn of the table"
}

output "aws_dynamodb_table_id" {
  value       = "${aws_dynamodb_table.this.id}"
  description = "The name of the table"
}

output "aws_dynamodb_table_stream_arn" {
  value       = "${aws_dynamodb_table.this.stream_arn}"
  description = " The ARN of the Table Stream. Only available when stream_enabled = true"
}

output "aws_dynamodb_table_stream_label" {
  value       = "${aws_dynamodb_table.this.stream_label}"
  description = "A timestamp, in ISO 8601 format, for this stream. Note that this timestamp is not a unique identifier for the stream on its own. However, the combination of AWS customer ID, table name and this field is guaranteed to be unique. It can be used for creating CloudWatch Alarms. Only available when stream_enabled = true"
}

# API Gateway Rest API
output "aws_api_gateway_rest_api_id" {
  value       = "${aws_api_gateway_rest_api.this.id}"
  description = "The ID of the REST API"
}

output "aws_api_gateway_rest_api_root_resource_id" {
  value       = "${aws_api_gateway_rest_api.this.root_resource_id}"
  description = "The resource ID of the REST API's root"
}

output "aws_api_gateway_rest_api_created_date" {
  value       = "${aws_api_gateway_rest_api.this.created_date}"
  description = "The creation date of the REST API "
}

output "aws_api_gateway_rest_api_execution_arn" {
  value       = "${aws_api_gateway_rest_api.this.execution_arn}"
  description = "The execution ARN part to be used in lambda_permission's source_arn when allowing API Gateway to invoke a Lambda function, e.g. arn:aws:execute-api:eu-west-2:123456789012:z4675bid1j, which can be concatenated with allowed stage, method and resource path."
}

output "aws_api_gateway_rest_api_arn" {
  value       = "${aws_api_gateway_rest_api.this.arn}"
  description = "Amazon Resource Name (ARN)"
}

# API Gateway Resource
output "aws_api_gateway_resource_create_index_id" {
  value       = "${aws_api_gateway_resource.create_index.id}"
  description = "The resource's identifier."
}

output "aws_api_gateway_resource_create_index_path" {
  value       = "${aws_api_gateway_resource.create_index.path}"
  description = "The complete path for this API resource, including all parent paths. "
}

output "aws_api_gateway_resource_read_update_delete_id" {
  value       = "${aws_api_gateway_resource.read_update_delete.id}"
  description = "The resource's identifier."
}

output "aws_api_gateway_resource_read_update_delete_path" {
  value       = "${aws_api_gateway_resource.read_update_delete.path}"
  description = "The complete path for this API resource, including all parent paths. "
}