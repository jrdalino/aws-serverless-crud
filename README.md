# aws-serverless-crud

## Architecture Diagram
![Image description](https://github.com/jrdalino/aws-serverless-crud/blob/master/images/architecture-diagram.png)

## Prerequisites
Provision an S3 bucket to store Terraform State and DynamoDB for state-lock
using https://github.com/jrdalino/aws-tfstate-backend-terraform

## Usage
- Install dependencies
```
$ cd ~/environment/aws-serverless-crud/src
$ python3 -m venv venv
$ source venv/bin/activate
(venv) $ venv/bin/pip install aws_xray_sdk
(venv) $ deactivate
$ cp -a venv/lib/python3.7/site-packages/. create/
$ cp -a venv/lib/python3.7/site-packages/. read/
$ cp -a venv/lib/python3.7/site-packages/. update/
$ cp -a venv/lib/python3.7/site-packages/. delete/
$ cp -a venv/lib/python3.7/site-packages/. index/
$ cd ~/environment/aws-serverless-crud
```
- Replace variables in terraform.tfvars
- Replace variables in state_config.tf
- Initialize, Review Plan and Apply
```
$ terraform init
$ terraform plan
$ terraform apply
```

https://b8duqglcoi.execute-api.ap-southeast-1.amazonaws.com/prod/todos

## Test
- CREATE a Todo
```
$ curl -X POST \
https://b8duqglcoi.execute-api.ap-southeast-1.amazonaws.com/prod/todos \
-H 'Content-Type: application/json' \
-d '{ "text": "Learn Tensorflow" }'
```

- Show Todos INDEX
```
$ curl -X GET \
https://b8duqglcoi.execute-api.ap-southeast-1.amazonaws.com/prod/todos
```

- READ one Todo
```
$ curl -X GET \
https://b8duqglcoi.execute-api.ap-southeast-1.amazonaws.com/prod/todos/1ea0a89c-75aa-11ea-b2d4-190d683eebf6
```

- UPDATE a Todo
```
$ curl -X PUT \
https://b8duqglcoi.execute-api.ap-southeast-1.amazonaws.com/prod/todos/1ea0a89c-75aa-11ea-b2d4-190d683eebf6 \
-H 'Content-Type: application/json' \
-d '{ "text": "Learn Serverless", "checked": true }'
```

- DELETE a Todo
```
$ curl -X DELETE \
https://b8duqglcoi.execute-api.ap-southeast-1.amazonaws.com/prod/todos/1ea0a89c-75aa-11ea-b2d4-190d683eebf6 \
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
- https://learn.hashicorp.com/terraform/aws/lambda-api-gateway
- https://medium.com/better-programming/how-to-build-a-serverless-api-with-dynamodb-aws-lambda-and-api-gateway-d61ac63c27dd
- https://www.codementor.io/@jflevesque/serverless-python-profiler-for-aws-lambda-using-aws-x-ray-egx5ze7m2
- https://medium.com/nordcloud-engineering/tracing-serverless-application-with-aws-x-ray-2b5e1a9e9447
- https://docs.aws.amazon.com/lambda/latest/dg/python-tracing.html
