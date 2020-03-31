# General
variable "aws_region" {
  type        = string
  description = "Used AWS Region."    
}

variable "aws_account" {
  type        = string
  description = "Used AWS Account."    
}

# Lambda IAM Role and Policy
variable "lambda_service_role_name" {
  type        = string
  description = "Lambda Service Role name."
}

variable "lambda_service_role_policy_name" {
  type        = string
  description = "Lambda Service Role Policy name."
}

# Lambda: Create
variable "aws_lambda_function_name_create" {
  type        = string
  description = "Lambda Function name."    
}

# Lambda: Delete
variable "aws_lambda_function_name_delete" {
  type        = string
  description = "Lambda Function name."    
}

# Lambda: Get
variable "aws_lambda_function_name_get" {
  type        = string
  description = "Lambda Function name."    
}

# Lambda: List
variable "aws_lambda_function_name_list" {
  type        = string
  description = "Lambda Function name."    
}

# Lambda: Update
variable "aws_lambda_function_name_update" {
  type        = string
  description = "Lambda Function name."    
}

# DynamoDB Table
variable "aws_dynamodb_table_name" {
  type        = string
  description = "The name of the table, this needs to be unique within a region."    
}

variable "aws_dynamodb_table_hash_key" {
  type        = string
  description = "(Required, Forces new resource) The attribute to use as the hash (partition) key. Must also be defined as an attribute, see below."    
}

variable "aws_dynamodb_table_read_capacity" {
  type        = string
  description = "(Optional) The number of read units for this table. If the billing_mode is PROVISIONED, this field is required."    
}

variable "aws_dynamodb_table_write_capacity" {
  type        = string
  description = "(Optional) The number of write units for this table. If the billing_mode is PROVISIONED, this field is required."    
}

# API Gateway REST API
variable "aws_api_gateway_rest_api_name" {
  type        = string
  description = "(Required) The name of the REST API"    
}

variable "aws_api_gateway_rest_api_description" {
  type        = string
  description = "(Optional) The description of the REST API"    
}

# API Gateway Resource
variable "aws_api_gateway_resource_path_part_post_get" {
  type        = string
  description = "The last path segment of this API resource."    
}

variable "aws_api_gateway_resource_path_part_get_put_delete" {
  type        = string
  description = "The last path segment of this API resource."    
}