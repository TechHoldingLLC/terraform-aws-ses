import json

def lambda_handler(event):

    for record in event['Records']:

        # Message
        message = json.loads(record["Sns"]["Message"])
        print(message)