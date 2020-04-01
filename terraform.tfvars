# General
aws_region  = "ap-southeast-2"
aws_account = "222337787619"

# Lambda IAM Role and Policy
lambda_service_role_name        = "aws-serverless-crud-lambda-service-role"
lambda_service_role_policy_name = "aws-serverless-crud-lambda-service-role-policy"

# Lambda
aws_lambda_function_name_create = "aws-serverless-crud-create"
aws_lambda_function_name_read   = "aws-serverless-crud-read"
aws_lambda_function_name_update = "aws-serverless-crud-update"
aws_lambda_function_name_delete = "aws-serverless-crud-delete"
aws_lambda_function_name_index   = "aws-serverless-crud-index"

# DynamoDB Table
aws_dynamodb_table_name           = "todos"
aws_dynamodb_table_hash_key       = "id"
aws_dynamodb_table_read_capacity  = "1"
aws_dynamodb_table_write_capacity = "1"

# API Gateway REST API
aws_api_gateway_rest_api_name        = "todo-api"
aws_api_gateway_rest_api_description = "API for Todos"

# API Gateway Resource
aws_api_gateway_resource_path_part_create_index       = "todos"
aws_api_gateway_resource_path_part_read_update_delete = "{id}"