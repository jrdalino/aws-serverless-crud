# aws-serverless-crud

## Usage
```
terraform init
terraform plan
terraform apply
```

## Test
- CREATE a Todo
```
$ curl -X POST \
https://wih9odsh9c.execute-api.ap-southeast-2.amazonaws.com/prod/todos \
-H 'Content-Type: application/json' \
-d '{ "text": "Learn Serverless" }'
```

- Show Todos INDEX
```
$ curl -X GET \
https://wih9odsh9c.execute-api.ap-southeast-2.amazonaws.com/prod/todos
```

- READ one Todo
```
$ curl -X GET \
https://wih9odsh9c.execute-api.ap-southeast-2.amazonaws.com/prod/todos/6ca396b2-73c4-11ea-b8b4-61b15f1e4b3b
```

- UPDATE a Todo
```
$ curl -X PUT \
https://wih9odsh9c.execute-api.ap-southeast-2.amazonaws.com/prod/todos/6ca396b2-73c4-11ea-b8b4-61b15f1e4b3b \
-H 'Content-Type: application/json' \
-d '{ "text": "Learn Serverless", "checked": true }'
```

- DELETE a Todo
```
$ curl -X DELETE \
https://wih9odsh9c.execute-api.ap-southeast-2.amazonaws.com/prod/todos/6ca396b2-73c4-11ea-b8b4-61b15f1e4b3b \
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

## References
- https://learn.hashicorp.com/terraform/aws/lambda-api-gateway#allowing-api-gateway-to-access-lambda
- https://medium.com/better-programming/how-to-build-a-serverless-api-with-dynamodb-aws-lambda-and-api-gateway-d61ac63c27dd