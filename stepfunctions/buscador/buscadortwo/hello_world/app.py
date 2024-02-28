import json
import time 

def lambda_handler(event, context):

    time.sleep(10)

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "hello world",
            # "location": ip.text.replace("\n", "")
        }),
    }
