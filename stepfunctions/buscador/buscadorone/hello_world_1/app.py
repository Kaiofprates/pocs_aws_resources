import json
import time


def lambda_handler(event, context):

    time.sleep(20)

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "hello world from lambda 1",
        }),
    }
