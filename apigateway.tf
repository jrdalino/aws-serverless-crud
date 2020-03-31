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

# Resource
resource "aws_api_gateway_resource" "post_get" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = var.aws_api_gateway_resource_path_part_post_get
}

resource "aws_api_gateway_resource" "get_put_delete" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_resource.post_get.id
  path_part   = var.aws_api_gateway_resource_path_part_get_put_delete
}

# Method - POST
resource "aws_api_gateway_method" "post" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.post_get.id
  http_method   = "POST"
  authorization = "NONE"
  # authorizer_id
  # authorization_scopes
  # api_key_required
  # request_models
  # request_validator_id
  # request_parameters
}

# Lambda Function Integration - POST
resource "aws_api_gateway_integration" "lambda_post" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_method.post.resource_id
  http_method = aws_api_gateway_method.post.http_method

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

# Method - GET (All)
resource "aws_api_gateway_method" "get_all" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.post_get.id
  http_method   = "GET"
  authorization = "NONE"
  # authorizer_id
  # authorization_scopes
  # api_key_required
  # request_models
  # request_validator_id
  # request_parameters
}

# Lambda Function Integration - GET (All)
resource "aws_api_gateway_integration" "lambda_get_all" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_method.get_all.resource_id
  http_method = aws_api_gateway_method.get_all.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  # connection_type
  # connection_id
  uri                     = aws_lambda_function.list.invoke_arn
  # credentials
  # request_templates
  # request_parameters
  # passthrough_behavior
  # cache_key_parameters
  # cache_namespace
  # content_handling
  # timeout_milliseconds
}

# Method - GET (By Id)
resource "aws_api_gateway_method" "get_by_id" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.get_put_delete.id
  http_method   = "GET"
  authorization = "NONE"
  # authorizer_id
  # authorization_scopes
  # api_key_required
  # request_models
  # request_validator_id
  # request_parameters
}

# Lambda Function Integration - GET (By Id)
resource "aws_api_gateway_integration" "lambda_get_by_id" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_method.get_by_id.resource_id
  http_method = aws_api_gateway_method.get_by_id.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  # connection_type
  # connection_id
  uri                     = aws_lambda_function.get.invoke_arn
  # credentials
  # request_templates
  # request_parameters
  # passthrough_behavior
  # cache_key_parameters
  # cache_namespace
  # content_handling
  # timeout_milliseconds
}

# Method - PUT
resource "aws_api_gateway_method" "put" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.get_put_delete.id
  http_method   = "PUT"
  authorization = "NONE"
  # authorizer_id
  # authorization_scopes
  # api_key_required
  # request_models
  # request_validator_id
  # request_parameters
}

# TODO: Add Lambda Function Integration for PUT

# Method - DELETE
resource "aws_api_gateway_method" "delete" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.get_put_delete.id
  http_method   = "DELETE"
  authorization = "NONE"
  # authorizer_id
  # authorization_scopes
  # api_key_required
  # request_models
  # request_validator_id
  # request_parameters
}

# TODO: Add Lambda Function Integration for DELETE

# TODO: Uncomment Deployment
# Deployment
# resource "aws_api_gateway_deployment" "this" {
#   depends_on = [
#     aws_api_gateway_integration.lambda,
#     aws_api_gateway_integration.lambda_root,
#   ]

#   rest_api_id = aws_api_gateway_rest_api.this.id
#   stage_name  = "prod"
# }