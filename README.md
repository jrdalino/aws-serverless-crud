# aws-serverless-crud

## Architecture Diagram
![Image description](https://github.com/jrdalino/aws-serverless-crud/blob/master/images/architecture-diagram.png)

## Prerequisites
Provision an S3 bucket to store Terraform State and DynamoDB for state-lock
using https://github.com/jrdalino/aws-tfstate-backend-terraform

## Usage
- Replace variables in terraform.tfvars
- Replace variables in state_config.tf
- Initialize, Review Plan and Apply
```
$ terraform init
$ terraform plan
$ terraform apply
```

## Test
- CREATE a Todo
```
$ curl -X POST \
https://kb5qixynrj.execute-api.ap-southeast-2.amazonaws.com/prod/todos \
-H 'Content-Type: application/json' \
-d '{ "text": "Learn Serverless" }'
```

- Show Todos INDEX
```
$ curl -X GET \
https://kb5qixynrj.execute-api.ap-southeast-2.amazonaws.com/prod/todos
```

- READ one Todo
```
$ curl -X GET \
https://kb5qixynrj.execute-api.ap-southeast-2.amazonaws.com/prod/todos/362cc870-73cd-11ea-bb80-e7ecb3e9476b
```

- UPDATE a Todo
```
$ curl -X PUT \
https://kb5qixynrj.execute-api.ap-southeast-2.amazonaws.com/prod/todos/362cc870-73cd-11ea-bb80-e7ecb3e9476b \
-H 'Content-Type: application/json' \
-d '{ "text": "Learn Serverless", "checked": true }'
```

- DELETE a Todo
```
$ curl -X DELETE \
https://kb5qixynrj.execute-api.ap-southeast-2.amazonaws.com/prod/todos/362cc870-73cd-11ea-bb80-e7ecb3e9476b \
-H 'Content-Type: application/json'
```

## Making an Application Code Change
- Make application code change and push latest changes to remote repo
```
git add .
git commit -m "Insert descriptive comment here"
git push origin master
```
- Compresses the source code into the /build folder
```
$ terraform plan 
```
- Deploy changes to prod
```
$ terraform apply
```
- Roll Back to a previous version (To follow)

## (TODO) Inputs 
| Name | Description |
|------|-------------|
| | |

## (TODO) Outputs
| Name | Description |
|------|-------------|
| | |

## References
- https://learn.hashicorp.com/terraform/aws/lambda-api-gateway#allowing-api-gateway-to-access-lambda
- https://medium.com/better-programming/how-to-build-a-serverless-api-with-dynamodb-aws-lambda-and-api-gateway-d61ac63c27dd