# aws-serverless-crud

## Usage
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

## References
