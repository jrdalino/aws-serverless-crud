# aws-serverless-crud

## Usage
```
terraform init
terraform plan
terraform apply
```

## Test
- Create a Todo
```
$ curl -X POST \
https://eqao6wcrck.execute-api.ap-southeast-2.amazonaws.com/prod/todos \
-H 'Content-Type: application/json' \
-d '{ "text": "Learn Serverless" }'
```

- List all Todos
```
$ curl -X GET \
https://eqao6wcrck.execute-api.ap-southeast-2.amazonaws.com/prod/todos
```

- Get one Todo
```
$ curl -X GET \
https://eqao6wcrck.execute-api.ap-southeast-2.amazonaws.com/prod/todos/d1831873-71df-11ea-87bd-7557fc10d6dd
```

- Update a Todo
```
$ curl -X PUT \
https://eqao6wcrck.execute-api.ap-southeast-2.amazonaws.com/prod/todos/d1831873-71df-11ea-87bd-7557fc10d6dd \
-H 'Content-Type: application/json' \
-d '{ "text": "Learn Scala", "checked": true }'
```

- Delete a Todo
```
$ curl -X DELETE \
https://eqao6wcrck.execute-api.ap-southeast-2.amazonaws.com/prod/todos/d1831873-71df-11ea-87bd-7557fc10d6dd \
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