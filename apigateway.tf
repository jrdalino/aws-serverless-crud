# API Gateway
resource "aws_api_gateway_rest_api" "this" {
  name                   = var.aws_api_gateway_rest_api_name
  description            = var.aws_api_gateway_rest_api_description
  endpoint_configuration {
      types = ["REGIONAL"]
  }
  # binary_media_types
  # minimum_compression_size
  # body
  # policy
  # api_key_source
  # tags
}

# Resource - /todos
resource "aws_api_gateway_resource" "create_index" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = var.aws_api_gateway_resource_path_part_create_index
}

# Method - Create
resource "aws_api_gateway_method" "create" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.create_index.id
  http_method   = "POST"
  authorization = "NONE"
  # authorizer_id
  # authorization_scopes
  # api_key_required
  # request_models
  # request_validator_id
  # request_parameters
}

# Lambda Function Integration - Create
resource "aws_api_gateway_integration" "create" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_method.create.resource_id
  http_method = aws_api_gateway_method.create.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  # connection_type
  # connection_id
  uri                     = aws_lambda_function.create.invoke_arn
  # credentials
  # request_templates
  # request_parameters
  # passthrough_behavior
  # cache_key_parameters
  # cache_namespace
  # content_handling
  # timeout_milliseconds
}

# Method - Index
resource "aws_api_gateway_method" "index" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.create_index.id
  http_method   = "GET"
  authorization = "NONE"
  # authorizer_id
  # authorization_scopes
  # api_key_required
  # request_models
  # request_validator_id
  # request_parameters
}

# Lambda Function Integration - Index
resource "aws_api_gateway_integration" "index" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_method.index.resource_id
  http_method = aws_api_gateway_method.index.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  # connection_type
  # connection_id
  uri                     = aws_lambda_function.index.invoke_arn
  # credentials
  # request_templates
  # request_parameters
  # passthrough_behavior
  # cache_key_parameters
  # cache_namespace
  # content_handling
  # timeout_milliseconds
}

# Resource - /todos/{id}
resource "aws_api_gateway_resource" "read_update_delete" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_resource.create_index.id
  path_part   = var.aws_api_gateway_resource_path_part_read_update_delete
}

# Method - Read
resource "aws_api_gateway_method" "read" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.read_update_delete.id
  http_method   = "GET"
  authorization = "NONE"
  # authorizer_id
  # authorization_scopes
  # api_key_required
  # request_models
  # request_validator_id
  # request_parameters
}

# Lambda Function Integration - Read
resource "aws_api_gateway_integration" "read" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_method.read.resource_id
  http_method = aws_api_gateway_method.read.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  # connection_type
  # connection_id
  uri                     = aws_lambda_function.read.invoke_arn
  # credentials
  # request_templates
  # request_parameters
  # passthrough_behavior
  # cache_key_parameters
  # cache_namespace
  # content_handling
  # timeout_milliseconds
}

# Method - Update
resource "aws_api_gateway_method" "update" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.read_update_delete.id
  http_method   = "PUT"
  authorization = "NONE"
  # authorizer_id
  # authorization_scopes
  # api_key_required
  # request_models
  # request_validator_id
  # request_parameters
}

# Lambda Function Integration - Update
resource "aws_api_gateway_integration" "update" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_method.update.resource_id
  http_method = aws_api_gateway_method.update.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  # connection_type
  # connection_id
  uri                     = aws_lambda_function.update.invoke_arn
  # credentials
  # request_templates
  # request_parameters
  # passthrough_behavior
  # cache_key_parameters
  # cache_namespace
  # content_handling
  # timeout_milliseconds
}

# Method - DELETE
resource "aws_api_gateway_method" "delete" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.read_update_delete.id
  http_method   = "DELETE"
  authorization = "NONE"
  # authorizer_id
  # authorization_scopes
  # api_key_required
  # request_models
  # request_validator_id
  # request_parameters
}

# Lambda Function Integration - DELETE
resource "aws_api_gateway_integration" "delete" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_method.delete.resource_id
  http_method = aws_api_gateway_method.delete.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  # connection_type
  # connection_id
  uri                     = aws_lambda_function.delete.invoke_arn
  # credentials
  # request_templates
  # request_parameters
  # passthrough_behavior
  # cache_key_parameters
  # cache_namespace
  # content_handling
  # timeout_milliseconds
}

# Deployment
resource "aws_api_gateway_deployment" "this" {
  depends_on = [
    aws_api_gateway_integration.create,
    aws_api_gateway_integration.index,
    aws_api_gateway_integration.read,
    aws_api_gateway_integration.update,
    aws_api_gateway_integration.delete,
    ]
  rest_api_id = aws_api_gateway_rest_api.this.id
  stage_name  = "prod"
}