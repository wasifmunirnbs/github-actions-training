import json
import boto3
import os
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

s3 = boto3.client('s3')

def lambda_handler(event, context):
    logger.info(f"Received event: {json.dumps(event)}")

    if 'Records' not in event or not event['Records']:
        logger.error("No 'Records' found in the event")
        return {
            'statusCode': 400,
            'body': json.dumps("No 'Records' found in the event")
        }

    target_bucket = os.environ['TARGET_BUCKET']

    for record in event['Records']:
        try:
            source_bucket = record['s3']['bucket']['name']
            object_key = record['s3']['object']['key']

            logger.info(f"Processing object {object_key} from bucket {source_bucket}")

            # Get object size
            response = s3.head_object(Bucket=source_bucket, Key=object_key)
            object_size = response['ContentLength']
            logger.info(f"Object size: {object_size} bytes")

            # Copy the object
            copy_source = {'Bucket': source_bucket, 'Key': object_key}
            s3.copy_object(CopySource=copy_source, Bucket=target_bucket, Key=object_key)
            
            logger.info(f"Successfully copied {object_key} from {source_bucket} to {target_bucket}")

        except Exception as e:
            logger.error(f"Error processing object {object_key} from bucket {source_bucket}: {e}")

    return {
        'statusCode': 200,
        'body': json.dumps('Processing complete')
    }
