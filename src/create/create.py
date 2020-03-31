import json
import logging
import os
import time
import uuid
import boto3

def lambda_handler(event, context):
    
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('todos')

    try:
        text = event["text"]
    except:
        data = json.loads(event['body'])
        text = data['text']
        if 'text' not in data:
            logging.error("Validation Failed")
            raise Exception("Couldn't create the todo item.")

    timestamp = str(time.time())

    item = {
        'id': str(uuid.uuid1()),
        'text': text,        
        'checked': False,
        'createdAt': timestamp,
        'updatedAt': timestamp,
    }

    # write the todo to the database
    table.put_item(Item=item)

    # create a response
    response = {
        "statusCode": 200,
        "body": json.dumps(item)
    }

    return response